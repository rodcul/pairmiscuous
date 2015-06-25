class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :full_name
      t.string :profile_picture
      t.string :slack_username

      t.timestamps null: false
    end
  end
end
