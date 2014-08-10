require 'rails_helper'

RSpec.feature 'Root Page' do

  before do
    visit root_path
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

  scenario 'user signs up with the sign up form' do
    sign_up_with 'joe', 'blo', 'valid@example.com', 'password'
    visit signup_path
  end

end
