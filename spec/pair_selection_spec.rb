require 'rails_helper'
require './app/helpers/pairings_helper'
include PairingsHelper

describe 'Create a pair' do

  def create_test_cohort(cohort_size)
    @cohort = Cohort.create()
    @user = []
    cohort_size.times {@user << @cohort.users.create()}
  end

  it 'should return a cohort pair partner' do
    create_test_cohort(2)
    result = pair_me(@user[0],@cohort)
    expect(result).to eq([@user[1]])
  end

  it 'should return all cohort partners excluding the user being matched' do
    create_test_cohort(20)
    result = pair_me(@user[0],@cohort).sort
    expect(result.length).to eq(19)
    @user[1..19].each { |use| expect(result).to include(use) }
    expect(result).not_to include(@user[0])
  end

  it 'should return all cohort partners excluding those already paired today' do

  end

end

describe 'Pair up a cohort' do
  # to be written
end
