require "test_helper"

class CreateControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get create_login_url
    assert_response :success
  end
end
