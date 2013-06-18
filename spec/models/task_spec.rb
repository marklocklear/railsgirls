require 'spec_helper'

describe Task do

  #
  # Factory
  #

  describe "creating Factory instances" do
    it "should succeed creating a new :task from the Factory" do
      lambda { create(:task) }.should_not raise_error
    end

    it "should be an instance of Task" do
      create(:task).should be_a_kind_of Task
    end

    it "should be a valid Task" do
      create(:task).should be_valid
    end
  end

  #
  # Validations
  #

  describe "validations" do
  	subject { create(:task) }

  	it { should validate_presence_of(:name) }

    context "mass assignment" do
      [:completed, :idea_id, :name, :notes, :team_members].each do |attribute|
        it { should allow_mass_assignment_of(attribute) }
      end
    end
  end

  #
  # Associations
  #

  describe "associations" do
  	subject { create(:task) }

  	it { should belong_to(:idea) }
  end

end
