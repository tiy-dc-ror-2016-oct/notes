require 'test_helper'

class MicroPostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get micro_posts_url, params: {github_login: 'rposborne'}
    assert_response :success
  end

  def test_case_name

  end

end
