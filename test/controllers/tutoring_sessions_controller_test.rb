require "test_helper"

class TutoringSessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get tutoring_sessions_new_url
    assert_response :success
  end

  test "should get create" do
    get tutoring_sessions_create_url
    assert_response :success
  end
end
