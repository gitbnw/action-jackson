require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get finish_signup" do
    get users_finish_signup_url
    assert_response :success
  end

end
