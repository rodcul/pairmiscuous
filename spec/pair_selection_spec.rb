require 'rails_helper'
require './app/helpers/pairings_helper'
include PairingsHelper

describe 'Create a pair' do

  it 'should return an available pair partner' do

    cohort = Cohort.create()
    user = []
    user[1] = cohort.users.create()
    user[2] = cohort.users.create()

    result = pair_me(user[1],cohort)
    expect(result).to eq([user[2]])
  end

  it 'should return all available partners excluding the user being matched' do
    cohort = Cohort.create()
    user = []
    20.times {user << cohort.users.create()}
    result = pair_me(user[0],cohort).sort
    expect(result.length).to eq(19)
    user[1..19].each { |use| expect(result).to include(use) }
    expect(result).not_to include(user[0])
  end

end

describe 'Pair up a cohort' do
  # to be written
end
