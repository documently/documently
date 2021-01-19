require "rake/testtask"

task default: :test

Rake::TestTask.new(:test) do |task|
  task.description = "Run the entire test suite"
  task.libs << "test"
  task.pattern = "test/**/*_test.rb"
end

namespace :test do
  Rake::TestTask.new(:unit) do |task|
    task.description = "Run the unit test suite"
    task.libs << "test"
    task.pattern = "test/unit/**/*_test.rb"
  end

  Rake::TestTask.new(:acceptance) do |task|
    task.description = "Run the acceptance test suite"
    task.libs << "test"
    task.pattern = "test/acceptance/**/*_test.rb"
  end
end

desc "Generate code coverage"
task :coverage do
  ENV["COVERAGE"] = "true"
  Rake::Task[:test].invoke
end
