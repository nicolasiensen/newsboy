require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "getting the dashboard" do
    sign_in users(:mary)
    get root_path
    assert_response :success
  end

  test "getting the dashboard when the user has no producer" do
    sign_in users(:mila)
    get root_path
    assert_redirected_to new_producer_path
  end

  test "getting the dashboard when the user is not logged in" do
    get root_path
    assert_redirected_to new_user_session_path
  end
end
