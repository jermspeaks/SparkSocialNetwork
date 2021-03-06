require 'rails_helper'

describe Availability do

  before do
    @user = User.create(first_name: "John", last_name: "Doe", email: "me@example.com", password: "12345")
    @availability = Availability.create(text: "Happy Cake Day!", user: @user)
  end

  it "should have an availability given a user" do
    expect(@availability.user).to be_a User
  end

  it 'should be valid with text' do
    availability = Availability.new(text: "This should be valid")
    expect(availability).to be_valid
  end

  it 'should be an invalid availability if the text field is blank' do
    new_availability = Availability.new
    expect(new_availability).to be_invalid
  end

  it "should not be an empty string" do
    expect(@availability).to be_valid
    expect(@availability.text).not_to eq("")
  end

end
