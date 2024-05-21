require "test_helper"

class Api::V1::AccountControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_account_index_url
    assert_response :success
  end

  test "should get show" do
    get api_v1_account_show_url
    assert_response :success
  end

  test "should get create" do
    get api_v1_account_create_url
    assert_response :success
  end

  test "should get update" do
    get api_v1_account_update_url
    assert_response :success
  end

  test "should get destroy" do
    get api_v1_account_destroy_url
    assert_response :success
  end
end
