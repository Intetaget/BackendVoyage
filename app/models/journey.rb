class Journey < ActiveRecord::Base
  has_many :images
  belongs_to :user


  has_attached_file :photo
  validates_presence_of :title, :description, :region, :user_id
  validates_attachment_file_name :photo, matches: [
  /gif\Z/, /gifv\Z/, /png\Z/, /jpg\Z/, /jpeg\Z/
  ]
end
