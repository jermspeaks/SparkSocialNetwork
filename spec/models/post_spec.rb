require 'rails_helper'

RSpec.describe Post, :type => :model do

  before do
    @user = User.create(first_name: "Si", last_name: "G", email: "s@gmail.com")
  end

  describe 'attributes' do
    context "#status" do
      it 'should return post status' do
        post = Post.create(poster: @user, status: "I'm at a concert. Yay!")
        expect(post.status).to eq("I'm at a concert. Yay!")
      end
    end
  end

  describe 'associations' do
    it "should have many photos" do
      t = Post.reflect_on_association(:photos)
      expect(t.macro).to eq(:has_many)
    end

    it 'should have many photos' do
        photo = Photo.create(description: "hello everyone")
        post = Post.create(poster: @user)
        post.photos << photo
        expect(post.photos.length).to eq(1)
        expect(post.photos[0]).to eq(photo)
    end

    it "should have many comments" do
      t = Post.reflect_on_association(:comments)
      expect(t.macro).to eq(:has_many)
    end

    it 'should return comment objects' do
        post = Post.create(poster: @user)
        comment = Comment.create(text: "ayy", commenter: @user, post: post)
        expect(post.comments.length).to eq(1)
        expect(post.comments[0]).to be_a Comment
    end

  end

  describe 'validations' do
    it 'should be valid with text' do
      post = Post.new(poster: @user)
      expect(post).to be_valid
    end

    it 'should be invalid without a poster' do
      post = Post.new
      expect(post).to be_invalid
    end
  end

  describe '#poster' do
    it 'should return the id of who posted it' do
      post = Post.create(poster: @user)
      expect(post.poster).to be_a User
      expect(post.poster).to eq(@user)
    end
  end

end
