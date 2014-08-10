require 'rails_helper'


RSpec.feature 'Feed Page' do
	
	before do
		@user = User.create(first_name: "Joe", last_name: "Blo", email: "me@example.com", password: "12345", password_confirmation: "12345")
		visit login_path
		login(@user)
		visit feed_path
	end

	it 'should show the posts' do
		expect(page).to have_content('SPARK FEED')
	end
end