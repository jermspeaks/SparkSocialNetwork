class Post < ActiveRecord::Base
  belongs_to :poster, class_name: "User"
  belongs_to :timeline, class_name: "User"
  has_many :post_photos
  has_many :photos, through: :post_photos
  has_many :comments

  validates_presence_of :poster

  def time_elapsed
  	Time.now - Time.parse(self.created_at.to_s)
  end
end
