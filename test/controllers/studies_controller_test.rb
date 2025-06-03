require "test_helper"

class StudiesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get studies_new_url
    assert_response :success
  end

  test "should get create" do
    get studies_create_url
    assert_response :success
  end
end
