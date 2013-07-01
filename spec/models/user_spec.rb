require 'spec_helper'

describe User do

  #
  # Factory
  #

  describe "creating Factory instances" do
    it "should succeed creating a new :user from the Factory" do
      lambda { create(:user) }.should_not raise_error
    end

    it "should be an instance of user" do
      create(:user).should be_a_kind_of User
    end

    it "should be a valid user" do
      create(:user).should be_valid
    end
  end

  #
  # Validations
  #

  describe "validations" do
  	subject { create(:user) }

  	it { should validate_confirmation_of(:password) }
  	it { should validate_presence_of(:email) }
  	it { should validate_uniqueness_of(:email) }

    context "mass assignment" do
      [:email, :password, :password_confirmation].each do |attribute|
        it { should allow_mass_assignment_of(attribute) }
      end
    end
  end

  #
  # Callbacks
  #

  describe "Callbacks" do
    describe "encrypt_password" do
      let(:user) { build(:user) }

      context "before saving" do
        it "should not have password_salt before save" do
          user.password_salt.should be_nil
        end

        it "should not have password_salt before save" do
          user.password_hash.should be_nil
        end
      end

      context "after saving" do
        before(:each) { user.save }

        it "should have a password_hash after save" do
          user.password_salt.should_not be_nil
        end

        it "should have a password_hash after save" do
          user.password_hash.should_not be_nil
        end
      end
    end
  end

  #
  # Authentication
  #

  describe "authenticate" do
    let(:user) { create(:user) }

    describe "with a valid email and password" do
      it "should return the User" do
        User.authenticate(user.email, "MyString").should == user
      end
    end

    describe "without a valid email" do
      it "should return nil" do
        User.authenticate("example@example.com", "MyString").should be_nil
      end
    end

    describe "without a valid password" do
      it "should return nil" do
        User.authenticate(user.email, "WrongPassword").should be_nil
      end
    end
  end
end