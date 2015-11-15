class AddPhotoFileNameToJourneysTable < ActiveRecord::Migration
  def change
    add_column :journeys, :photo_file_name, :string
  end
end
