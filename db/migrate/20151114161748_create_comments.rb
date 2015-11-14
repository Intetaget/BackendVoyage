class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :description, null: false
      t.integer :image_id, null: false

      t.timestamps null: false
    end
  end
end
