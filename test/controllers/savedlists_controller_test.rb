require 'test_helper'

class SavedlistsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get savedlists_show_url
    assert_response :success
  end

end
