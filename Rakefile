# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "weather_fetcher"
  gem.homepage = "http://github.com/akwiatkowski/weather_fetcher"
  gem.license = "LGPLv3"
  gem.summary = %Q{Fetch weather from various providers in one place}
  gem.description = %Q{At this moment you can fetch weather http://www.worldweatheronline.com/, from various Polish websites (Onet.pl, Wp.pl, Interia.pl) and from some METAR providers. More providers coming soon :)}
  gem.email = "bobikx@poczta.fm"
  gem.authors = ["Aleksander Kwiatkowski"]
  # dependencies defined in Gemfile

  gem.files = FileList[
    "[A-Z]*", "{bin,generators,lib,test}/**/*"
  ]
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :default => :spec

require 'rdoc'
require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "weather_fetcher #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

desc "Run RSpec with code coverage"
task :coverage do
  `rake spec COVERAGE=true`
  #`open coverage/index.html`
end