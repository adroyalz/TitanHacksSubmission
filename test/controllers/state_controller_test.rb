require 'test_helper'

class StateControllerTest < ActionDispatch::IntegrationTest
  test "should get info" do
    get state_info_url
    assert_response :success
  end

end
