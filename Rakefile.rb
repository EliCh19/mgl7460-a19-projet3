require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'

RUBY_PATH = "C:/Ruby26-x64/bin"
SOLUTION = "E:/Canada/programs/ruby/TP3/MGL_7460/main/user_info.rb"

RUBY_TEST_PATH = "E:/Canada/programs/ruby/TP3/MGL_7460/features/verification.feature"

desc 'all task with the dependency of all of the tasks'
task :all => [:program, :test]

desc 'compiling the program'
task :program do
	sh "#{RUBY_PATH}/ruby.exe #{SOLUTION}"
	puts "-------------------------------"
	puts "starting the test"
end

desc 'testing the program'
task :test do
  sh "#{RUBY_PATH}/cucumber #{RUBY_TEST_PATH}"
end

