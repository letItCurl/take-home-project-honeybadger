require "test_helper"

class Api::V1::Webhooks::SlackControllerTest < ActionDispatch::IntegrationTest
  test "should get send" do
    get api_v1_webhooks_slack_send_url
    assert_response :success
  end
end
