class Image < ActiveRecord::Base
  has_many :comments
  belongs_to :journey

  has_attached_file :image
  validates :image, attachment_presence: true
  validates_attachment_file_name :image, matches: [
  /gif\Z/, /gifv\Z/, /png\Z/, /jpg\Z/, /jpeg\Z/
  ]

  validates_inclusion_of :file_type, in: ["png", "gif", "jpeg", "jpg"],
    message: "%{value} must be one of: 'png', 'gif', or 'jpeg/jpg'."
  validates_presence_of :journey_id, :file_name, :url
  
end
