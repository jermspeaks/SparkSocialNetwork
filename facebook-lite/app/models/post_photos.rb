class PostPhotos < ActiveRecord::Base

  belongs_to :post
  belongs_to :photo

end
