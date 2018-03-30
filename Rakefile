begin
  require 'bundler/setup'
rescue LoadError => e
  abort e.message
end

require 'rake'
require 'rubygems/tasks'
Gem::Tasks.new

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new

task :test    => :spec
task :default => :spec

require 'yard'
YARD::Rake::YardocTask.new  
task :doc => :yard

file 'spec/sslyze.xml' do
  sh 'sslyze --xml_out spec/sslyze.xml --regular --resum_rate --http_headers twitter.com github.com:443 www.yahoo.com:443 google.com:443 foo bar'
end
