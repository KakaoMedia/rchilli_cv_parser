require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new("spec")

task :default => :spec
task :console do
  exec "pry -r rchilli_cv_parser -I ./lib"
end

