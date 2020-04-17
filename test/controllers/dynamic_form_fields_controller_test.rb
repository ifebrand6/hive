require 'test_helper'

class DynamicFormFieldsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dynamic_form_fields_index_url
    assert_response :success
  end

  test "should get new" do
    get dynamic_form_fields_new_url
    assert_response :success
  end

  test "should get show" do
    get dynamic_form_fields_show_url
    assert_response :success
  end

  test "should get edit" do
    get dynamic_form_fields_edit_url
    assert_response :success
  end

end
