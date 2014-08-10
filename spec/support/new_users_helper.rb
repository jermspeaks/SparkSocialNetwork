
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
      user = User.create(first_name: "Gatorade", last_name: "Thirst", email: "simon@rade.com", password: "simon", password_confirmation: "simon")
      fill_in('user_email', :with => user.email)
      fill_in('user_password', :with => user.password)
      click_button('LOG IN')
    end
  end
