class AddPairIdToPairing < ActiveRecord::Migration
  def change
    add_column :pairings, :pair_id, :integer
  end
end
