require 'test_helper'

class ExpertApplicationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get experts_index_url
    assert_response :success
  end

end
