require 'test_helper'

class MicroPostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get micro_posts_url
    assert_response :success
  end

  test "can show a form for a new micro_post" do
    get "/micro_posts/new"
    assert_response :success
  end

  test "can create a micro_post" do
    post "/micro_posts", params: { micro_post: {title: "Tale of Two Cities", user_id: users(:jane_doe).id} }
    assert_response :redirect

    assert_equal MicroPost.last.title, "Tale of Two Cities"
  end
end
