require 'spec_helper'

describe ProctorRspec::Config do
  subject do
    ProctorRspec::Config.new do |config|
      config.server = "http://192.168.1.100:4567"
      config.project_name = "Example Project"
    end
  end
  
  describe "server" do
    specify "it should be valid" do
      subject.server.scheme.should == 'http'
      subject.server.host.to_s.should == '192.168.1.100'
      subject.server.port.should == 4567
    end
  end
end
