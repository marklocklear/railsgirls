require 'spec_helper'

describe UsersController do
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
  end

  #
  # New (Signup)
  #

  context "GET new" do
    before(:each) { get :new }

    it { should respond_with(:success) }
    it { should render_template(:new) }

    it "assigns a new user as @user" do
      assigns(:user).should be_a_new(User)
    end
  end

  #
  # Create
  #

  context "POST create" do
    describe "with valid params" do
      before(:each) do
        @email = Faker::Internet.email
        post :create, :user => { "email" => @email, "password" => 123456789,  "password_confirmation" => 123456789}
      end

      it { should respond_with(:redirect) }
      it { should redirect_to(root_url) }

      it "assigns a newly created user as @user" do
        assigns(:user).should be_a(User)
        assigns(:user).should be_persisted
      end

      it "should set the email address as @email" do
        assigns(:user).email.should == @email
      end
    end

    it "creates a new User" do
      expect {
        post :create, {:user => attributes_for(:user)}
      }.to change(User, :count).by(1)
    end

    describe "with invalid params" do
      before(:each) do
        User.any_instance.stub(:save).and_return(false)
        post :create, :user => {}
      end

      it { should respond_with(:success) }
      it { should render_template(:new) }

      it "assigns a newly created but unsaved user as @user" do
        assigns(:user).should be_a_new(User)
      end

      it "re-renders the 'new' template" do
        response.should render_template("new")
      end
    end
  end

end
