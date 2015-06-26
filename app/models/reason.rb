class Reason < ActiveRecord::Base
  validates :reason, presence: true
  belongs_to :cohort
  belongs_to :user
end
