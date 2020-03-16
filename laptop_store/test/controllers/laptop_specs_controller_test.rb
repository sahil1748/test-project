require 'test_helper'

class LaptopSpecsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get laptop_specs_new_url
    assert_response :success
  end

  test "should get create" do
    get laptop_specs_create_url
    assert_response :success
  end

  test "should get edit" do
    get laptop_specs_edit_url
    assert_response :success
  end

  test "should get update" do
    get laptop_specs_update_url
    assert_response :success
  end

end
