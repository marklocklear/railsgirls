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

  	it { should have_many(:tasks) }
  end

  #
  # Scopes
  #

  describe "scopes" do
    let(:idea) { create(:idea) }

    context "ranged" do
      it "should return an Idea with the requested range" do
        idea.update_attribute(:range, 8)
        Idea.ranged(8).include?(idea).should be true
      end

      it "should not raise an error if passed nil" do
        lambda{ Idea.ranged(nil) }.should_not raise_error
      end

      it "should not return an Idea with a different range" do
        idea.update_attribute(:range, 8)
        Idea.ranged(4).include?(idea).should be false
      end
    end

    context "random" do
      it "should not raise an error" do
        lambda{ Idea.random }.should_not raise_error
      end
    end
  end

end


# scope :ranged, lambda { |range| where(:range => range) if range }















