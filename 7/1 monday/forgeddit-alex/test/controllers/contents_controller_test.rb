require 'test_helper'

class ContentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    user = User.create!(email: "amax3002@gmail.com", password: "password")
    Content.create!(title: "The grand adeventures of moose", label_type: "picture", description: "It's a great book", user_id: user.id)
    Content.create!(title: "The second grand adeventures of moose", label_type: "picture", description: "It's a great book", user_id: user.id)
    get contents_path
    assert_response :success
    assert_select "h4", {count: 1}
  end

  test "should get new content" do
    User.create(email: "amax3002@gmail.com", password: "password")
    post session_path, params: {email: "amax3002@gmail.com", password: "password"}
    get new_content_path()
    assert_response :success
    assert_select ".title", { count: 1, text: "New Content Input"}
    # assert_match /New Content Input/, response.body
  end

  test "should get create content" do
    User.create(email: "amax3002@gmail.com", password: "password")
    post session_path, params: {email: "amax3002@gmail.com", password: "password"}
    post "/contents", params: {content: {name: "amax3002@gmail.com", type: "password", description: "lalala"}}
    assert_response :success
  end

end
