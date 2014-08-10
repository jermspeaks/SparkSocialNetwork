require 'rails_helper'

RSpec.feature 'Login Page' do

  before do
    visit login_path
  end

  context 'navigation bar' do

    it 'should show the sign-in link' do
      expect(page).to have_content('SIGN IN')
    end

    it 'should show the home link' do
      expect(page).to have_content('SPARK')
    end

    it 'should not show the logout link' do
      expect(page).to_not have_content('LOG OUT')
    end

  end

  scenario 'user signs in with the sign in form' do
    expect(page).to have_content('WELCOME TO SPARK LOGIN PAGE')
    sign_in_with 'simon@rade.com', 'simon'
    
  end

end
