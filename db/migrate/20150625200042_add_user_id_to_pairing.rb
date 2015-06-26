class AddUserIdToPairing < ActiveRecord::Migration
  def change
    add_reference :pairings, :user, index: true, foreign_key: true
  end
end
