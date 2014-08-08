require 'rails_helper'


RSpec.feature 'Feed Page' do
	
	before do
		# @user = User.create(first_name: "Joe", last_name: "Blo", email: "me@example.com", password: "12345", password_confirmation: "12345")
		# session[:user_id] = @user.id
		visit feed_path
	end

	it 'should show the posts' do

		expect(page).to have_content('Welcome To Your Feed')
	end
end