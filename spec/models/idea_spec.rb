require 'spec_helper'

describe "creating Factory instances" do
  it "should succeed creating a new :idea from the Factory" do
    lambda { create(:idea) }.should_not raise_error
  end

  it "should be an instance of Idea" do
    create(:idea).should be_a_kind_of Idea
  end

  it "should be a valid Idea" do
    create(:idea).should be_valid
  end

	describe "validations" do
		subject { create(:idea) }
		it {should validate_presence_of(:name)}
		it {should validate_uniqueness_of(:name)}
		it {should validate_presence_of(:description)}
	end
end
