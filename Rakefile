# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require(File.join(File.dirname(__FILE__), 'config', 'boot'))

require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'


require 'tasks/rails'

namespace :hudson do
  task :spec => ["hudson:setup:rspec", "rake:spec"]

  namespace :setup do
    task :pre_ci do
      ENV["CI_REPORTS"] = "hudson/reports/spec/"
      gem "ci_reporter"
      require "ci/reporter/rake/rspec/"
    end
    task :rspec => [:pre_ci, "ci:setup:rspec"]
  end
end
