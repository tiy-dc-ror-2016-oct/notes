require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_user_path
    assert_response :success
  end

  test "should create user" do
    User.create(email: "lll3002@gmail.com", password: "password")
    post users_path, params: {user: {email: "lll53002@gmail.com", full_name: 'Alex G', password: "password"}}
    assert_response :redirect
  end

end
