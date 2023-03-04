require "test_helper"

class TeamperformancesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get teamperformances_index_url
    assert_response :success
  end

  test "should get show" do
    get teamperformances_show_url
    assert_response :success
  end

  test "should get create" do
    get teamperformances_create_url
    assert_response :success
  end

  test "should get update" do
    get teamperformances_update_url
    assert_response :success
  end

  test "should get destory" do
    get teamperformances_destory_url
    assert_response :success
  end
end
