module UserHelper
  
  def login(user)
    visit login_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'LOG IN'
  end
  
  def logout
    visit root_path
    click_link 'LOG OUT'
  end
  
end