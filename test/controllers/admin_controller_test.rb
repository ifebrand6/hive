require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_dashboard_url
    assert_response :success
  end

  test "should get application" do
    get admin_application_url
    assert_response :success
  end

  test "should get talents" do
    get talent_requests_url
    assert_response :success
  end

end
