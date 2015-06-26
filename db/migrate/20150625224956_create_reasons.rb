class CreateReasons < ActiveRecord::Migration
  def change
    create_table :reasons do |t|
      t.integer :pair_id
      t.string :reason

      t.timestamps null: false
    end
  end
end
