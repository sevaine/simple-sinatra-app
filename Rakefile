#
# simple sinatra app -- Rakefile
#
APP = 'sinatra-helloworld'

namespace :docker do
  desc "Build a docker image for the app"
  task :build, [:version] do |task, args|
    version = args['version'] ||= ENV.fetch('BUILD_NUMBER', 'unversioned')
    dockerfile = File.join(
      File.expand_path(
        File.dirname('.')), "docker/Dockerfile.#{APP}")
    puts "Building #{APP}:#{version}"
    sh "docker build -t #{APP}:#{version} -f #{dockerfile} ."
  end
  desc "Build and run docker image based on current code"
  task :quickrun do
    Rake::Task["docker:build"].reenable
    Rake::Task["docker:build"].invoke("dev-environment")
    sh "docker run -it -p 8080:8080 -p 8443:8443 #{APP}:dev-environment"
  end
  desc "Run docker container at name and version specified"
  task :run, [:name, :version] do |task, args|
    version = args['version'] ||= ENV.fetch('BUILD_NUMBER', 'unversioned')
    name = args['name'] ||= APP
    sh "docker run -it -p 8080:8080 -p 8443:8443 #{name}:#{version}"
  end
end
