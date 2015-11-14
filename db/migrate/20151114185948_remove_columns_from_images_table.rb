class RemoveColumnsFromImagesTable < ActiveRecord::Migration
  def change
    remove_column :images, :title, :string
    remove_column :images, :file_type, :string
    remove_column :images, :file_size, :string
  end
end
