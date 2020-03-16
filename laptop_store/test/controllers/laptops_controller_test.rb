require 'test_helper'

class LaptopsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get laptops_new_url
    assert_response :success
  end

  test "should get create" do
    get laptops_create_url
    assert_response :success
  end

  test "should get index" do
    get laptops_index_url
    assert_response :success
  end

  test "should get show" do
    get laptops_show_url
    assert_response :success
  end

  test "should get edit" do
    get laptops_edit_url
    assert_response :success
  end

  test "should get update" do
    get laptops_update_url
    assert_response :success
  end

  test "should get destroy" do
    get laptops_destroy_url
    assert_response :success
  end

end
