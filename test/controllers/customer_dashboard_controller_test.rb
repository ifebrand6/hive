require 'test_helper'

class CustomerDashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customer_dashboard_index_url
    assert_response :success
  end

  test "should get finalized_requests" do
    get customer_dashboard_finalized_requests_url
    assert_response :success
  end

  test "should get show_finalized_request" do
    get customer_dashboard_show_finalized_request_url
    assert_response :success
  end

  test "should get make_payment_for_finalized_request" do
    get customer_dashboard_make_payment_for_finalized_request_url
    assert_response :success
  end

  test "should get transactions" do
    get customer_dashboard_transactions_url
    assert_response :success
  end

  test "should get show_transcation" do
    get customer_dashboard_show_transcation_url
    assert_response :success
  end

  test "should get request" do
    get customer_dashboard_request_url
    assert_response :success
  end

  test "should get show_request" do
    get customer_dashboard_show_request_url
    assert_response :success
  end

  test "should get delete_request" do
    get customer_dashboard_delete_request_url
    assert_response :success
  end

end
