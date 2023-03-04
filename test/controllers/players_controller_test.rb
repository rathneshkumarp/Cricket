require "test_helper"

class PlayersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get players_index_url
    assert_response :success
  end

  test "should get show" do
    get players_show_url
    assert_response :success
  end

  test "should get create" do
    get players_create_url
    assert_response :success
  end

  test "should get update" do
    get players_update_url
    assert_response :success
  end

  test "should get destory" do
    get players_destory_url
    assert_response :success
  end
end
