require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

	describe "GET index" do
    it "returns http success" do
      get :new
      expect(response).to be_success
    end
  end

end
