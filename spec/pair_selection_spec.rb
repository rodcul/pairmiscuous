require 'rails_helper'
require './app/helpers/pairings_helper'
include PairingsHelper

describe 'Create a pair' do

  it 'should return an available pair partner' do
    # puts "Cohorts: #{Cohort.all.length}"
    # puts "Users: #{User.all.length}"
    # puts "Pairings: #{Pairing.all.length}"

    cohort = Cohort.create()
    user = []
    user[1] = cohort.users.create()
    user[2] = cohort.users.create()

    result = pair_me(user[1],cohort)
    expect(result).to eq([user[2]])
  end

end

describe 'Pair up a cohort' do
  # to be written
end
