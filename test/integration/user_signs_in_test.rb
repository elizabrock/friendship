require 'test_helper'

class UserSignsInTest < ActionDispatch::IntegrationTest
  def setup
    visit "/"
    click_on "Sign In"
    page.must_not have_link("Sign In")
  end

  test "user signs in with valid credentials" do
    user = Fabricate(:user, name: "Jenny")
    fill_in "Email", with: user.email
    fill_in "Password", with: "password1"
    click_button "Sign In"
    page.should have_content("Welcome back, Jenny")
    page.should_not have_content("Sign In")
    page.should_not have_content("Sign Up")
    page.should have_content("Sign Out")
    # Smoke testing Sign Out:
    click_on "Sign Out"
    page.should have_content("You have been signed out")
    page.should have_content("Sign In")
    page.should_not have_content("Sign Out")
  end

  test "user attempts to sign in with invalid email" do
    Fabricate(:user, email: "susie@example.com", password: "ThisIsAwesome", password_confirmation: "ThisIsAwesome")
    fill_in "Email", with: "joe@example.com"
    fill_in("Password", with: "ThisIsAwesome")
    click_on "Sign In"
    page.should have_content("We could not sign you in. Please check your email/password and try again.")
  end

  test "user attempts to sign in with invalid password" do
    user = Fabricate(:user, name: "Bob")
    fill_in "Email", with: user.email
    fill_in "Password", with: "wrongpassword"
    click_button "Sign In"
    page.should have_content("We could not sign you in. Please check your email/password and try again.")
    page.should_not have_content("Create your account")
    page.should_not have_content("Password confirmation")
    field_labeled("Email").value.should == user.email
    fill_in "Password", with: "password1"
    click_button "Sign In"
    page.should have_content("Welcome back, Bob")
  end
end
