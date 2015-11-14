class Comment < ActiveRecord::Base
  belongs_to :image

  validates_presence_of :body, :image_id
end
