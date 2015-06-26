class AddUserToReasons < ActiveRecord::Migration
  def change
    add_reference :reasons, :users, index: true, foreign_key: true
  end
end
