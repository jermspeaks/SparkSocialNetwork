
  module NewUsersHelpers
    def sign_up_with(first_name, last_name, email, password)
      fill_in 'First Name', with: first_name
      fill_in 'Last Name', with: last_name
      fill_in 'Email', with: email
      fill_in 'Enter Password', with: password
      fill_in 'Confirm Password', with: password
      click_link 'START FLYING'
    end

    def sign_in_with(email, password)
      user = create(:user)
      visit sign_in_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign in'
    end
  end

