class Journey < ActiveRecord::Base
  has_many :images
  belongs_to :user

  validates_presence_of :title, :description, :region, :user_id
end
