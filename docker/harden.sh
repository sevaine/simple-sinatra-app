#!/bin/bash
trap "on_exit" INT TERM EXIT

#
# script functions
#

function on_exit()
{
  echo "quitting"
}

function log()
{
  echo "[$(date)]: $@"
}

function info()
{
  log "INFO: $@"
}

function warn()
{
  log "WARNING: $@"
}

function error()
{
  log "ERROR: $@"
  exit 1
}

#
# Vars
#
DEFAULT_USERNAME=user
DEFAULT_UID=1000
REMOVE_CRONTABS="/var/spool/cron /etc/crontabs /etc/periodic"
SYSDIRS="/bin /etc /lib /sbin /usr"
INIT_SCRIPTS="/etc/init.d /lib/rc /etc/conf.d /etc/inittab /etc/runlevels /etc/rc.conf"
KERNEL_TUNABLES='/etc/sysctl* /etc/modprobe.d /etc/modules /etc/mdev.conf /etc/acpi'

info "starting image hardening..."
info "Setting up default user ${DEFAULT_USERNAME}"
adduser -D -s /bin/sh -u ${DEFAULT_UID} ${DEFAULT_USERNAME} \
  && info "User added." \
  || error "Failed to create ${DEFAULT_USER}!"

info "Removing user from /etc/shadow"
sed -i -r "s/^${DEFAULT_USER}:!:/${DEFAULT_USER}:x:/" /etc/shadow \
  && info "done." \
  || error "Failed to yank user from /etc/shadow!"

info "  - Clobbering crontabs.  YAGNI"
for target in ${REMOVE_CRONTABS} ; do
  if [[ -e ${target} ]] ; then
    rm -fr ${target} \
      && info "    > Removed ${target}" \
      || warn "    > Failed to remove ${target}"
  fi
done

info "Remove non-essential admin commands"
find /sbin /usr/sbin/ -type l | egrep -v "nologin|apk|chown|chmod|bash|adduser|addgroup" | xargs rm

info "Removing any world-writable permissions. ( /tmp excluded )"
find / -xdev -type d -perm +0002 -a ! -name /tmp -exec chmod o-w {} + \
  && info "removed world-writable permissions on dirs." \
  || error "Failed to clean up world-writable permissions on dirs"
find / -xdev -type f -perm +0002 -exec chmod o-w {} + \
  && info "removed world writable permissions on files." \
  || error "Failed to clean up world-writable permissions on files!"

info "No interactive login shell for anyone but ${DEFAULT_USER}"
sed -i -r "/^${DEFAULT_USER}:/! s#^(.*):[^:]*\$#\1:/sbin/nologin#" /etc/passwd \
  && info "done." \
  || error "Failed to disable interactive login shell for users other than ${DEFAULT_USER}!"

info "Cleanup unneeded cruft in ${SYSDIRS}"
find ${SYSDIRS} -xdev -regex '.*-$' -print -exec rm -f {} +

info "Enforce system dirs ownership (root:root, 0755)"
find ${SYSDIRS} -xdev -type d -exec chown root:root {} \; -exec chmod 0755 {} \;

info "Remove init scripts - unneeded."
for target in ${INIT_SCRIPTS} ; do
  if [[ -e ${target} ]] ; then
    rm -fr ${target} \
      && info "Removed ${target}" \
      || warn "Failed to remove ${target}"
  fi
done

info "removing kernel tunables - unneeded"
for target in ${KERNEL_TUNABLES} ; do
  rm -fr ${target} \
    && info "removed ${target}" \
    || warn "failed to remove ${target}"
done

info "Cleanup root homedir - unneeded"
rm -fr /root

info "Find and clean up any broken symlinks in ${SYSDIRS}"
find ${SYSDEV} -xdev -type l -exec test ! -e {} \; -delete
