require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do

    get content_comments_path(3)
    assert_response :success
  end

  test "should get new comment" do
    user = User.create(email: "amax3002@gmail.com", password: "password")
    post session_path, params: {email: "amax3002@gmail.com", password: "password"}

    Content.create!(title: "A", label_type: "lala", description: "Test", user_id: user.id)

    get new_content_comment_path(Content.last.id)
    assert_response :success
    # assert_select "h1", "New Content Input"
  end

  test "should get create comment" do
    user = User.create(email: "amax3002@gmail.com", password: "password")
    post session_path, params: {email: "amax3002@gmail.com", password: "password"}

    Content.create!(title: "A", label_type: "lala", description: "Test", user_id: user.id)

    post "/contents/:comment_id/comments", params: {comment: {user_id: User.last.id, content_id: Content.last.id, user_comment: "awesome"}}
    assert_response :redirect
    # assert_select "h1", "New Content Input"
  end




end
