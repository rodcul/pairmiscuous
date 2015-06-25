class AddUserToReasons < ActiveRecord::Migration
  def change
    add_reference :reason, :users, index: true, foreign_key: true
  end
end
