class CreateJourneys < ActiveRecord::Migration
  def change
    create_table :journeys do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.date :start
      t.date :end
      t.string :region, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
