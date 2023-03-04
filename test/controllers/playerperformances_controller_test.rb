require "test_helper"

class PlayerperformancesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get playerperformances_index_url
    assert_response :success
  end

  test "should get show" do
    get playerperformances_show_url
    assert_response :success
  end

  test "should get create" do
    get playerperformances_create_url
    assert_response :success
  end

  test "should get update" do
    get playerperformances_update_url
    assert_response :success
  end

  test "should get destory" do
    get playerperformances_destory_url
    assert_response :success
  end
end
