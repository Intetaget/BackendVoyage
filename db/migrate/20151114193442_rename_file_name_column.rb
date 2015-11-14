class RenameFileNameColumn < ActiveRecord::Migration
  def change
    remove_column :images, :file_name, :string
    add_column :images, :photo_file_name, :string
  end
end
