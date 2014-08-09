class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  has_many :statuses
  has_many :comments, foreign_key: "commenter_id"
  has_many :user_profile_pics
  has_many :profile_pics, through: :user_profile_pics, source: :photo
  has_many :posts, foreign_key: "poster_id"
  has_many :photos, through: :posts # has many photos (in all posts)
  has_many :uploaded_photos, class_name: "Photo", foreign_key: "uploader_id"
  has_many :user_friends
  has_many :friends, through: :user_friends, source: :friend
  has_many :friend_requests
  has_many :requests, through: :friend_requests, source: :requester

  def send_request(receiver_id)
    receiver = User.find(receiver_id)
    if (receiver && !receiver.friends.include?(self) && !receiver.requests.include?(self))
      receiver.friend_requests.create(user_id: receiver_id, requester_id: self.id)
    else
      nil
    end
  end

  def accept_request(requester_id)
    requester = User.find(requester_id)
    if (requester && self.requests.include?(requester) && !self.friends.include?(requester))
      # add friends
      UserFriend.create(user_id: self.id, friend_id: requester_id)
      UserFriend.create(user_id: requester_id, friend_id: self.id)
      # delete request
      FriendRequest.where(user_id: self.id, requester_id: requester_id).take!.destroy
      self.reload
    else
      nil
    end
  end

  def reject_request(requester_id)
    FriendRequest.where(user_id: self.id, requester_id: requester_id).take!.destroy
    self.reload
  end
end
