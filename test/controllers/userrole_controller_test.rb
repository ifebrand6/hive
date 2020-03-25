require 'test_helper'

class UserroleControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get userrole_index_url
    assert_response :success
  end

  test "should get test" do
    get userrole_test_url
    assert_response :success
  end

end
