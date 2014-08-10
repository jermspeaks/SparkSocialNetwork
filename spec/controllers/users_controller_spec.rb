require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

	describe "GET #new" do
    it "should render the template and return http success" do
      get :new
      expect(response).to render_template("new")
      expect(response).to be_success
    end
  end

  describe 'POST #create' do
  	subject { post :create, :user => {first_name: "Jeremy", last_name: "Wong", email: "jwon@gmail.com", password: "12345", password_confirmation: "12345" } }

  	it 'should create a new user' do
  		expect(subject).to redirect_to(assigns(:user))
  	end
  end

  describe 'GET #show' do
  	before do 
  		@user = User.create(first_name: "Jeremy", last_name: "Wong", email: "jwon@gmail.com", password: "12345", password_confirmation: "12345")
  	end

  	it 'should show a user profile' do
  		visit user_path(@user)
  		expect(response).to render_template("show")
  		expect(response).to be_success
  	end
	end

  # describe 'GET #edit' do
  # 	it 'should show a user edit profile' do
  # 	end
  # end

  # describe 'PUT #update' do
  # 	it 'should update a user\'s profile'
  # end

  # describe 'DELETE #delete' do
  # 	it 'should delete a user\'s profile'
  # end

  describe 'POST #send_request'

  describe 'POST #accept_request'

  describe 'POST #reject_request'

  describe 'GET #friends' do
  	before do 
  		@user = User.create(first_name: "Jeremy", last_name: "Wong", email: "jwon@gmail.com", password: "12345", password_confirmation: "12345")
  	end

  	it 'should show a user profile' do
  		visit user_friends_path(@user)
  		expect(response).to render_template("friends")
  		expect(response).to be_success
  	end
  end
end
