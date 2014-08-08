require 'rails_helper'

RSpec.describe FeedHelper, :type => :helper do
  describe '#current_user' do
  	it 'should return the current user if the current user holds a session' do
  		@user = User.create(first_name: "Joe", last_name: "Blo", email: "me@example.com", password: "12345", password_confirmation: "12345")
  		session[:user_id] = @user.id
  		expect(current_user).to eq(@current_user)
  	end
  end
end
