class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :full_name, null: false
      t.string :email, null: false
      t.string :avatar
      t.string, :password_digest
      t.string :access_token

      t.timestamps null: false
    end
  end
end
