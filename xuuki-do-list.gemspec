# Ensure we require the local version and not one we might have installed already
require File.join([File.dirname(__FILE__),'lib','xuuki-do-list','version.rb'])
spec = Gem::Specification.new do |s|
  s.name = 'xuuki-do-list'
  s.version = XuukiToDo::VERSION
  s.author = 'Joel Nash'
  s.email = 'joel.nash@xuuki.xyz'
  s.homepage = 'http://www.xuuki.xyz'
  s.platform = Gem::Platform::RUBY
  s.summary = 'Manage tasks in a todo list'
  s.files = `git ls-files`.split("
")
  s.require_paths << 'lib'
  s.extra_rdoc_files = ['README.rdoc','xuuki-do-list.rdoc']
  s.rdoc_options << '--title' << 'xuuki-do-list' << '--main' << 'README.rdoc' << '-ri'
  s.bindir = 'bin'
  s.executables << 'xuuki-do-list'
  s.add_development_dependency('rake')
  s.add_development_dependency('rdoc')
  s.add_development_dependency('minitest')
  s.add_development_dependency('aruba', '~> 0.4.6')
  s.add_runtime_dependency('gli','~> 2.22.1')
end
