require 'spec_helper'

describe SessionsController do
  render_views

  #
  # Security
  #

  describe "Controller Security" do
    context "When logged in" do
      before(:each) { login_user }

      describe "GET new" do
        before(:each) { get :new }
        it_should_behave_like "require no user"
      end

      describe "POST create" do
        before(:each) { post :create, :id => 1 }
        it_should_behave_like "require no user"
      end
    end

    context "When NOT logged in" do
      describe "DELETE destroy" do
        before(:each) { delete :destroy }
        it_should_behave_like "require user"
      end
    end
  end

  #
  # New
  #

  describe "GET new" do
    before(:each) { get :new }

    it { should respond_with(:success) }
    it { should render_template(:new) }
  end

  #
  # Create / Login
  #

  describe "POST create" do
    let(:user) { create(:user) }

    context "with a valid password and a valid user" do
      before(:each) { post :create, :email => user.email, :password => "MyString" }

      it { should redirect_to(root_path) }

      it "should set the session with the User id" do
        session[:user_id].should == user.id
      end
    end

    context "with an invalid password" do
      before(:each) { post :create, :email => user.email, :password => "wrong" }

      it { should respond_with(:success) }
      it { should render_template(:new) }

      it "should NOT set the session with the User id" do
        session[:user_id].should be nil
      end
    end
  end

  #
  # Destroy / Logout
  #

  describe "DELETE destroy" do
    before(:each) do
      @user = create(:user)
      session[:user_id] = @user.id
      delete :destroy
    end

    it { should respond_with(:redirect) }
    it { should redirect_to(root_path) }

    it "should NOT set the session with the User id" do
      session[:user_id].should be nil
    end
  end
end
