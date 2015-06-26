require 'rails_helper'
require './app/helpers/pairings_helper'
include PairingsHelper

describe 'Create a pair' do

  def create_test_cohort(cohort_size)
    @cohort = Cohort.create()
    @user = []
    cohort_size.times {@user << @cohort.users.create()}
  end

  def create_pair_history(cohort,number_pairs,date=Date.today)
    number_pairs.times do
      user = unpaired_users_today(cohort)[0]
      save_entire_pair([user,pair_me(user)[0]])
    end
  end

  it 'should return a cohort pair partner' do
    create_test_cohort(2)
    result = pair_me(@user[0])
    expect(result).to eq([@user[1]])
  end

  it 'should return all cohort partners excluding the user being matched' do
    create_test_cohort(20)
    result = pair_me(@user[0]).sort
    expect(result.length).to eq(19)
    @user[1..19].each { |use| expect(result).to include(use) }
    expect(result).not_to include(@user[0])
  end

  it 'should return all cohort partners excluding those already paired today' do
    create_test_cohort(20)
    create_pair_history(@cohort,5)
    expect(pair_me(unpaired_users_today(@cohort)[0]).length).to eq 9
  end

end

describe 'Pair up a cohort' do
  # to be written
end
