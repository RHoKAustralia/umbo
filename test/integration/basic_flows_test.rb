require 'test_helper'

class BasicFlowsTest < ActionDispatch::IntegrationTest
  test "can see the welcome page" do
    get "/"
    assert_response :success
    assert_select "title", "Umbo"
    assert_select "h1", "Welcome to Umbo"
  end

  test "can see the login page with a form" do
    get "/users/sign_in"
    assert_response :success
    assert_select "h1", "Log In"
    assert_select "form"
  end

  test "can see the sign-up page with a form" do
    get "/users/sign_up"
    assert_response :success
    assert_select "h1", "Sign up"
    assert_select "form"
  end

  test "cannot log in without password" do
    post "/users/sign_in",
      params: { user: { email: User.first.email, password: "not a real password" } }

    assert_select "a", "Login"  # there should still be a "Login" link
  end

  test "can log in" do
    User.all.each do |user|
      log_in(user.email)
      assert_response :redirect, "#{user} can't log in!"
    end
  end

  test "can log out after log in" do
    User.all.each do |user|
      log_in_and_follow(user.email)
      delete "/users/sign_out"
      assert_redirected_to "/"
    end
  end

end
