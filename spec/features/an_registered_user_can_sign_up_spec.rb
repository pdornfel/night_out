require 'spec_helper'

feature "A new user can sign up => " do

  # As an unregistered user
  # I want to be able to sign up
  # So i can be admitted into the site

  scenario "A user enteres in all valid information into sign up" do
    user = FactoryGirl.build(:user)
    visit new_user_registration_path
    fill_in "First Name", with: user.first_name
    fill_in "Last Name", with: user.last_name
    fill_in "Email", with: user.email
    fill_in "user_password", with: user.password
    fill_in "user_password_confirmation", with: user.password
    click_button "Sign Up"
    expect(page).to have_content("Welcome! You have signed up successfully.")
    expect(page).to have_content("Sign Out")
    expect(page).to_not have_content("Sign In")
  end

end