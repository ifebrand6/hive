require 'test_helper'

class GetExpertsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get get_experts_index_url
    assert_response :success
  end

end
