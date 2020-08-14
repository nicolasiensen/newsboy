require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  test "signing up" do
    visit new_user_registration_path
    
    fill_in "Email", with: "nicolas@newsboy.dev"
    fill_in "Password", with: "my-secret-password"
    fill_in "Password confirmation", with: "my-secret-password"
    click_on "Sign up"

    assert_text "Welcome! You have signed up successfully."
    assert_equal root_path, page.current_path
  end

  test "signing up when there is an error" do
    visit new_user_registration_path
    
    click_on "Sign up"

    assert_equal user_registration_path, page.current_path
    assert_text "Email can't be blank"
    assert_text "Password can't be blank"
  end

  test "signing in" do
    visit new_user_session_path

    email = "nicolas@newsboy.dev"
    password = "my-secret-password"
    User.create(email: email, password: password)
    
    fill_in "Email", with: email
    fill_in "Password", with: password
    click_on "Log in"

    assert_text "Signed in successfully."
    assert_equal root_path, page.current_path
  end

  test "signing in when there is an error" do
    visit new_user_session_path

    fill_in "Email", with: "nicolas@newsboy.dev"
    fill_in "Password", with: "my-secret-password"
    click_on "Log in"

    assert_text "Invalid Email or password."
    assert_equal user_session_path, page.current_path
  end

  test "signing out" do
    email = "nicolas@newsboy.dev"
    password = "my-secret-password"
    user = User.create(email: email, password: password)
    login_as(user, scope: :user)

    visit root_path

    click_on "Sign out"

    assert_text "Signed out successfully."
    assert_equal new_user_session_path, page.current_path
  end

  test "visiting the dashboard" do
    sign_in users(:mary)
    
    visit root_path

    assert_equal root_path, page.current_path
  end

  test "visiting the dashboard when the user is not logged in" do
    visit root_path

    assert_text "You need to sign in or sign up before continuing."
    assert_equal new_user_session_path, page.current_path
  end
end
