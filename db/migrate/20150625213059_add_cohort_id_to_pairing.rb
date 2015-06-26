class AddCohortIdToPairing < ActiveRecord::Migration
  def change
    add_reference :pairings, :cohort, index: true, foreign_key: true
  end
end
