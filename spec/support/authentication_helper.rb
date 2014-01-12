module AuthenticationHelper

  def sign_up_as(new_user)
    visit new_user_registration_path
    fill_in "First Name", with: new_user.first_name
    fill_in "Last Name", with: new_user.last_name
    fill_in "Email", with: new_user.email
    fill_in "user_password", with: new_user.password
    fill_in "user_password_confirmation", with: new_user.password
    click_button "Sign Up"
  end

  def sign_in_as(user)
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign in"
  end

end