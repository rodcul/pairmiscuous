class User < ActiveRecord::Base

  belongs_to :cohort
  belongs_to :pairing

end
