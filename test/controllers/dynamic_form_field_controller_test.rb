require 'test_helper'

class DynamicFormFieldControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dynamic_form_field_index_url
    assert_response :success
  end

  test "should get new" do
    get dynamic_form_field_new_url
    assert_response :success
  end

  test "should get edit" do
    get dynamic_form_field_edit_url
    assert_response :success
  end

  test "should get show" do
    get dynamic_form_field_show_url
    assert_response :success
  end

end
