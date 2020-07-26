require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
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

  test "signing in when there is an erro" do
    visit new_user_session_path

    fill_in "Email", with: "nicolas@newsboy.dev"
    fill_in "Password", with: "my-secret-password"
    click_on "Log in"

    assert_text "Invalid Email or password."
    assert_equal user_session_path, page.current_path
  end
end
