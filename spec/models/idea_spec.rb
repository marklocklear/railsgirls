require 'spec_helper'

describe Idea do

    describe "creating Factory instances" do
      it "should succeed creating a new :idea from the Factory" do
        lambda { create(:idea) }.should_not raise_error
      end

      it "should be an instance of Idea" do
        create(:idea).class.should == Idea
        create(:idea).should be_a_kind_of Idea
      end

      it "should be a valid Idea" do
        create(:idea).valid?.should be true
        create(:idea).should be_valid
      end
    end

end