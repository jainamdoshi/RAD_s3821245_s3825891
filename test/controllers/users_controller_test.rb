require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get createNewUser" do
    get users_createNewUser_url
    assert_response :success
  end

end
