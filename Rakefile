require 'rspec/core/rake_task'
require 'jeweler'

task :default => :spec

desc "Run specs"
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = "spec/**/*_spec.rb"
end

Jeweler::Tasks.new do |g|
	g.name = "mongoid_param"
	g.summary = "Parameterize your models in one line"
	g.description = "Addon to Mongoid that allows you to easily generate and query against human readable (parameterized) id's!"
	g.add_runtime_dependency("mongoid", ["~>2.0.0.beta4"])
	g.files = %w[README.rdoc VERSION lib/mongoid_param.rb]
	g.require_path = "lib"
	g.email = "jcoene@gmail.com"
	g.homepage = "http://github.com/jcoene/mongoid_param"
	g.authors = ["Jason Coene"]
end

Jeweler::GemcutterTasks.new

