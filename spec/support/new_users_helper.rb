
  module NewUsersHelper
    def sign_up_with(first_name, last_name, email, password)
      fill_in('user_first_name', :with => first_name)
      fill_in('user_last_name', :with => last_name)
      fill_in('user_email', :with => email)
      fill_in('user_password', :with => password)
      fill_in('user_password', :with => password)
      click_button('START FLYING')

    end

    def sign_in_with(email, password)
      user = create(:user)
      visit sign_in_path
      fill_in('Email', :with => user.email)
      fill_in('Password', :with => user.password)
      click_button 'Sign in'
    end
  end
