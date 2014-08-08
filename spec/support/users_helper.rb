module UserHelper
  
  def login(user)
    visit root_path
    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    click_button 'LOG IN'
  end
  
  def logout(user)
    visit root_path
    click_link 'LOG OUT'
  end
  
end