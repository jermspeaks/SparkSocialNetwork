require 'rails_helper'

RSpec.describe User, :type => :model do

  context 'attributes and validations' do
    before :each do
      @user1 = User.new(first_name: "Quy", last_name: "Tran", email: "quy@dbc.com", password: "123456")
      @user2 = User.new(email: "quy2@dbc.com")
      @user3 = User.new
      @user4 = User.new(first_name: "Quy", last_name: "Tran", email: "qqqqqq")
      @user5 = User.new(first_name: "Quy", email: "quy@dbc.com")
      @user6 = User.new(last_name: "Tran", email: "quy@dbc.com")
      @user7 = User.new(first_name: "Quy", last_name: "Tran", email: "quy@dbc.com")
      @user8 = User.new(first_name: "Mike", last_name: "Tran", email: "quy@dbc.com", password: "654321")
    end

    # Testing create validation

    it 'should validates user\'s first_name before creating' do
      expect{@user2.save!}.to raise_error
      expect{@user6.save!}.to raise_error
    end

    it 'should validates user\'s last_name before creating' do
      expect{@user5.save!}.to raise_error
    end

    it 'should validates user email before creating' do
      expect{@user3.save!}.to raise_error
    end

    it 'should validates email format' do
      expect{@user4.save!}.to raise_error
    end

    it 'should validates password presence' do
      expect{@user7.save!}.to raise_error
    end

    it 'should validates uniqueness of email' do
      @user1.save!
      expect{@user8.save!}.to raise_error
    end


    # Testing attributes
    it "user id must not be nil" do
        @user1.save!
        expect(@user1.id).to be_an(Integer)
    end

    it "should have first name" do
        @user1.save!
        expect(@user1.first_name).to eq("Quy")
    end

    it "should have last name" do
        @user1.save!
        expect(@user1.last_name).to eq("Tran")
    end

    it "should have email" do
        @user1.save!
        expect(@user1.email).to eq("quy@dbc.com")
    end
  end

  context 'associations type' do
    it 'should have has one availability' do
      expect(User.reflect_on_association(:availability).macro).to eq(:has_one)
    end

    it 'should have many comments' do
      expect(User.reflect_on_association(:comments).macro).to eq(:has_many)
    end

    it 'should have many profile pictures' do
      expect(User.reflect_on_association(:profile_pics).macro).to eq(:has_many)
    end

    it 'should have many posts' do
      expect(User.reflect_on_association(:posts).macro).to eq(:has_many)
    end

    it 'should have many photos' do
      expect(User.reflect_on_association(:photos).macro).to eq(:has_many)
    end

    it 'should have many user profile pics <joined table>' do
      expect(User.reflect_on_association(:user_profile_pics).macro).to eq(:has_many)
    end
  end

  context 'actual associations modification' do
    before do
      @user = User.new(first_name: "Quy", last_name: "Tran", email: "quy@dbc.com", password: "123456")
      @user.save
    end

    after do
      @user.destroy
    end

    it 'can create a new availability' do
      @user.availability.create(text: "I am happy")
      expect(@user.availability.last.text).to eq("I am happy")
      expect(@user.availability.last.user_id).to eq(@user.id)
    end

    it 'can create a new comment' do
      @user.comments.create(text: "Nice job")
      expect(@user.comments.last.text).to eq("Nice job")
      expect(@user.comments.last.commenter_id).to eq(@user.id)
    end

    it 'can create a new profile pic' do
      @user.profile_pics.create(description: "Sunset")
      expect(@user.profile_pics.last.description).to eq("Sunset")
    end

    it 'can create a new post' do
      @user.posts.create
      expect(@user.posts.last.poster_id).to eq(@user.id)
    end

    it 'can upload a new photo' do
      @user.uploaded_photos.create(description: "Sunrise")
      expect(@user.uploaded_photos.last.description).to eq("Sunrise")
      expect(@user.uploaded_photos.last.uploader_id).to eq(@user.id)
    end
  end

end
