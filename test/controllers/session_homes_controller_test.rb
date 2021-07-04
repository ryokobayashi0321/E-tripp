require "test_helper"

class SessionHomesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get session_homes_index_url
    assert_response :success
  end
end
