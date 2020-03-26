require 'test_helper'

class ExpertApplicationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get expert_applications_index_url
    assert_response :success
  end

end
