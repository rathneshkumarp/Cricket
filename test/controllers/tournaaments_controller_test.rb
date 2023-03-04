require "test_helper"

class TournaamentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tournaaments_index_url
    assert_response :success
  end

  test "should get show" do
    get tournaaments_show_url
    assert_response :success
  end

  test "should get create" do
    get tournaaments_create_url
    assert_response :success
  end

  test "should get update" do
    get tournaaments_update_url
    assert_response :success
  end

  test "should get destory" do
    get tournaaments_destory_url
    assert_response :success
  end
end
