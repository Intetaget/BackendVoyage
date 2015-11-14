class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :title
      t.string :file_name, null: false
      t.string :file_type
      t.string :url, null: false
      t.integer :file_size
      t.integer :journey_id, null: false

      t.timestamps null: false
    end
  end
end
