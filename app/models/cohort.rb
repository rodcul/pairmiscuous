class Cohort < ActiveRecord::Base

  has_many :users
  has_many :pairings
end
