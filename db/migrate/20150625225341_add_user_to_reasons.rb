class AddUserToReasons < ActiveRecord::Migration
  def change
    add_reference :reasons, :user, index: true, foreign_key: true
  end
end
