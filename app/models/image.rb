class Image < ActiveRecord::Base
  has_many :comments
  belongs_to :journey

  has_attached_file :photo
  validates :photo, attachment_presence: true
  validates_attachment_file_name :photo, matches: [
  /gif\Z/, /gifv\Z/, /png\Z/, /jpg\Z/, /jpeg\Z/
  ]

end
