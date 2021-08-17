require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get sessions" do
    get users_sessions_url
    assert_response :success
  end

end
