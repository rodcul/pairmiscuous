class User < ActiveRecord::Base

  belongs_to :cohort
  belongs_to :pairing
  has_many :pairings

end
