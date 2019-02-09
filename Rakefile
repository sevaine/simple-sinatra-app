#
# simple sinatra app -- Rakefile
#
APP = 'sinatra-helloworld'

namespace :build do
  desc "Build a docker image for the app"
  task :docker, [:version] do |task, args|
    version = args['version'] ||= ENV.fetch('BUILD_NUMBER', 'unversioned')
    dockerfile = File.join(
      File.expand_path(
        File.dirname('.')), "docker/Dockerfile.#{APP}")
    puts "Building #{APP}:#{version}"
    sh "docker build -t #{APP}:#{VERSION} -f #{dockerfile}"
  end
end
