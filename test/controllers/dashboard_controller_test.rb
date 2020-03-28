require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dashboard_index_url
    assert_response :success
  end

  test "should get application" do
    get dashboard_application_url
    assert_response :success
  end

  test "should get talents" do
    get dashboard_talents_url
    assert_response :success
  end

end
