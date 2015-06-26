class AddCohortIdToUser < ActiveRecord::Migration
  def change
    add_reference :users, :cohort, index: true, foreign_key: true
  end
end
