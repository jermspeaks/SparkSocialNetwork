class Availability < ActiveRecord::Base
  has_one :user

  validates_presence_of :text
end
