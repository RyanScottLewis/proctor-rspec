require 'spec_helper'

describe Calculator do
  describe "#sum" do
    specify "it should output the sum of the given numbers" do
      sleep 1
      subject.sum(5, 5, 5).should == 15
    end
  end
  
  describe "nested group 1" do
    describe "nested nested group 1" do
      specify "it should not fail" do
        sleep 1
        true.should == false
      end
    end
  end
  
  describe "#divide" do
    specify "it should output the result of the first number divided by the second number" do
      sleep 1
      pending
    end
  end
  
  describe "nested group 2" do
    specify "it should not fail" do
      sleep 1
      pending
      true.should == false
    end
  end
end