#
# Require User
#

share_examples_for "require user" do
  it { should respond_with(:redirect) }
  it { should redirect_to(log_in_path) }

  it "should not have a session" do
    session[:user_id].should be nil
  end
end

#
# Require No User
#

share_examples_for "require no user" do
  it { should respond_with(:redirect) }
  it { should redirect_to(root_path) }

  it "should have a session" do
    session[:user_id].should_not be nil
  end
end