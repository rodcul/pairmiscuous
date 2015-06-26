class User < ActiveRecord::Base
  belongs_to :cohort
  belongs_to :pairing
  has_many :pairings

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.profile_picture = auth.info.image
      user.username = auth.info.nickname
    end
  end
end
