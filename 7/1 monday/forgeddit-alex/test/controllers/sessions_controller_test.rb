require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_session_path
    assert_response :success
  end

  test "should get go away message" do
    User.create(email: "amax3002@gmail.com", password: "password")
    post session_path, params: {email: "amax3002@gmail.com", password: "wrong password"}
    assert_response :success
    #gets the element from html response that matches the selector
    assert_select ".alert.alert-danger", "Go AWAY!"
  end

  test "end session" do
    User.create(email: "amax3002@gmail.com", password: "password")
    post session_path, params: {email: "amax3002@gmail.com", password: "password"}
    delete session_path
    assert_response :redirect
  end

end
