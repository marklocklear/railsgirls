require 'spec_helper'

describe Idea do

  #
  # Factory
  #

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
  end

  #
  # Validations
  #

  describe "validations" do
  	subject { create(:idea) }

  	it { should validate_presence_of(:name) }
  	it { should validate_presence_of(:description) }
  	it { should validate_presence_of(:range) }

    context "mass assignment" do
      [:description, :name, :picture, :completed, :range].each do |attribute|
        it { should allow_mass_assignment_of(attribute) }
      end
    end
  end

  #
  # Associations
  #

  describe "associations" do
  	subject { create(:idea) }

  	it {should have_many(:tasks)}
  end

end