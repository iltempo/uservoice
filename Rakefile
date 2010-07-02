require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "uservoice"
    gem.summary = %Q{Uservoice for your Rails application}
    gem.description = %Q{This adds Uservoice support to your Rails application
      including single sign-on.}
    gem.email = 'alexxx@iltempo.de'
    gem.homepage = 'http://github.com/iltempo/uservoice'
    gem.authors = ['Alexander Greim']
    gem.version = '0.3.1'
    gem.add_dependency('ezcrypto', '>= 0.7.2')
    gem.add_dependency('activesupport', '>= 2.1')
    gem.add_dependency('actionpack', '>= 2.1')
    gem.add_dependency('rails', '>= 2.1')
    gem.has_rdoc = true
    gem.extra_rdoc_files = ["README.rdoc", "CHANGELOG.rdoc", "LICENSE"]
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/test_*.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end

task :test => :check_dependencies

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "uservoice #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
