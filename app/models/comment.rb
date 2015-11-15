class Comment < ActiveRecord::Base
  belongs_to :image

  validates_presence_of :description, :image_id
end
