require 'spec_helper'

describe IdeasController do
  render_views

  #
  # Index
  #

  describe "GET index" do
    before(:each) do
      @idea = create(:idea)
      get :index
    end

    it { should respond_with(:success) }
    it { should respond_with(200) }
    it { should render_template(:index) }
    it { should render_template(:application) }
  end

  #
  # New
  #

  context "GET new" do
    before(:each) do
      get :new
    end

    it { should respond_with(:success) }
    it { should render_template(:new) }

    it "assigns a new idea as @idea" do
      assigns(:idea).should be_a_new(Idea)
    end
  end

  #
  # Create
  #

  context "POST create" do
    describe "with valid params" do
      before(:each) do
        Idea.any_instance.stub(:save).and_return(true)
        post :create, :idea => attributes_for(:idea)
      end

      it { should respond_with(:redirect) }
      it { should redirect_to(assigns(:idea)) }

      it "assigns a newly created idea as @idea" do
        assigns(:idea).should be_a(Idea)
      end
    end

    describe "with invalid params" do
      before(:each) do
        Idea.any_instance.stub(:save).and_return(false)
        post :create, :idea => attributes_for(:idea)
      end

      it { should respond_with(:success) }
      it { should render_template(:new) }

      it "assigns a newly created but unsaved idea as @idea" do
        assigns(:idea).should be_a_new(Idea)
      end
    end
  end

  #
  # Edit
  #

  context "GET edit" do
    before(:each) do
      @idea = create(:idea)
      get :edit, :id => @idea.id
    end

    it { should respond_with(:success) }
    it { should render_template(:edit) }
  end

  #
  # Update
  #

  context "PUT update" do
    before do
      @idea = create(:idea)
    end

    describe "with valid params" do
      before(:each) do
        Idea.any_instance.stub(:save).and_return(true)
        put :update, :id => @idea, :idea => attributes_for(:idea, :description => "Instagr.am")
      end

      it { should respond_with(:redirect) }
      it { should redirect_to(assigns(:idea)) }

      it "should change the description to Instagr.am" do
        assigns(:idea).description.should == "Instagr.am"
      end
    end

    describe "with invalid params" do
      before(:each) do
        Idea.any_instance.stub(:save).and_return(false)
        put :update, :id => @idea, :idea => attributes_for(:idea)
      end

      it { should respond_with(:success) }
      it { should render_template(:edit) }
    end
  end

  #
  # Destroy
  #

  context "DELETE destroy" do
    before(:each) do
      @idea = create(:idea)
      delete :destroy, :id => @idea.id
    end

    it { should respond_with(:redirect) }
    it { should redirect_to(assigns(:idea)) }
  end
end