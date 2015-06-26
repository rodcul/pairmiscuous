require 'rails_helper'
require './app/helpers/pairings_helper'
include PairingsHelper
require 'byebug'

describe 'Create a pair' do

  def create_test_cohort(cohort_size)
    @cohort = Cohort.create()
    @user = []
    cohort_size.times {@user << @cohort.users.create()}
  end

  def create_pair_history(cohort,number_pairs,date=Date.today)
    number_pairs.times do
      pair_id = Pairing.maximum(:pair_id).to_i+1
      user = unpaired_users_today(cohort)[0]
      Pairing.create(pair_id: pair_id, user_id: user.id,
                     cohort_id: user.cohort_id, created_at: date)
      user = unpaired_users_today(cohort)[0]
      Pairing.create(pair_id: pair_id, user_id: user.id,
                     cohort_id: user.cohort_id, created_at: date)

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

  it 'should order potential partners by number of times paired' do
    create_test_cohort(20)
    create_pair_history(@cohort,9,Date.today.days_ago(1))
    create_pair_history(@cohort,4,Date.today.days_ago(2))
    expect(pair_me(@user[0]).length).to eq 19
  end

end

describe 'Pair up a cohort' do
  # to be written
end
