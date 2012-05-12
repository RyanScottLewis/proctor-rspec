require 'bundler/setup'
require 'proctor-rspec'

require File.expand_path('../lib/calculator', File.dirname(__FILE__))

ProctorRspec.configure do |c|
  c.project_name = 'proctor-rspec Example'
end

RSpec.configure do |c|
  c.formatter = ProctorRspec::Formatter
end
