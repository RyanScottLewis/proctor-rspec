$:.unshift( File.expand_path("../lib", __FILE__) )
PROJECT_NAME ||= File.basename(__FILE__, ".gemspec")
require "#{PROJECT_NAME}/version"

Gem::Specification.new do |s|
  s.author = "Ryan Scott Lewis"
  s.email = "c00lryguy@gmail.com"
  
  s.name = PROJECT_NAME
  s.description = "An RSpec formatter for Proctor."
  s.summary = "Watch you specs live in Proctor with this RSpec formatter."
  s.homepage = "http://github.com/c00lryguy/#{PROJECT_NAME}"
  s.version = ProctorRspec::VERSION
  s.license = 'MIT'
  s.platform = Gem::Platform::RUBY
  s.require_path = 'lib'
  
  s.files = Dir['{{Rake,Gem}file{.lock,},README*,VERSION,LICENSE,*.gemspec,{bin,examples,lib,spec,test}/**/*}']
  s.test_files = Dir['{examples,spec,test}/**/*']
  
  s.add_dependency("uniform_resource_identifier", "~> 0.1")
  s.add_dependency("rspec", "~> 2.9")
  s.add_dependency("activeresource", "~> 3.2")
  s.add_dependency("net-http-spy", "~> 0.2")
  # s.add_dependency("cached_resource", "~> 2.1")
  s.add_dependency("guard-rspec", "~> 0.7")
end
