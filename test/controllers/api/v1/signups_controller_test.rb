require 'test_helper'

class Api::V1::SignupsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get api_v1_signups_create_url
    assert_response :success
  end

end
