require 'rails_helper'

RSpec.describe "Photos", :type => :request do
  describe "GET /photos" do
    it "works! (now write some real specs)" do
      get photos_path
      expect(response.status).to be(200)
    end
  end
end
