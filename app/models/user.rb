class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  has_many :comments, foreign_key: "commenter_id"
  has_many :user_profile_pics
  has_one   :availability
  has_many :profile_pics, through: :user_profile_pics, source: :photo
  has_many :posts, foreign_key: "poster_id"
  has_many :photos, through: :posts # has many photos (in all posts)
  has_many :uploaded_photos, class_name: "Photo", foreign_key: "uploader_id"
  has_many :user_friends
  has_many :friends, through: :user_friends, source: :friend
  has_many :friend_requests
  has_many :requests, through: :friend_requests, source: :requester
  has_many :sent_requests, class_name: "FriendRequest", foreign_key: "requester_id"
  has_many :receivers, through: :sent_requests, source: :user
  has_many :timeline_posts, class_name: "Post", foreign_key: "timeline_id"

  def avatar_large
    if self.profile_pics.all.empty? 
      'default_150.png'
    else
      self.profile_pics.all.last.url.large
    end
  end

  def avatar_medium
    if self.profile_pics.all.empty? 
      'default_50.png'
    else
      self.profile_pics.all.last.url.medium
    end
  end

  def avatar_small
    if self.profile_pics.all.empty? 
      'default_35.png'
    else
      self.profile_pics.all.last.url.small
    end
  end


  def send_request(receiver_id)
    receiver = User.find(receiver_id)
    if (receiver && !receiver.friends.include?(self) && !receiver.requests.include?(self))
      FriendRequest.create(user_id: receiver_id, requester_id: self.id)
      self.reload
      receiver.reload
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
