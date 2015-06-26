module PairingsHelper

include MatrixHelper

  # Return an array of unpartnered users in descending order of attractiveness
  def pair_me(primary_user)

    available_users = unpaired_users_today(cohort_of_user(primary_user))
    available_users = remove_user(available_users, primary_user)

    # desirability is a hash that tracks desirability of each other user
    desirability = {}

    # initialise desirability as 1000 for 0 pairings, 500 for 1 etc
    number_of_pairings = count_of_user_pairings(primary_user)
    available_users.each do |user|
      desirability[user] = 1000 / (number_of_pairings[user].to_i + 1)
    end

    # sort available users according to desirability
    available_users.sort_by!{ |user| desirability[user] }.reverse!

    return available_users

  end

  def count_of_user_pairings(user)
    other_users = remove_user(users_in_same_cohort_as(user), user)
    number_of_pairings = {}

    other_users.each do |other_user|
      number_of_pairings[other_user] = times_paired_with(user,other_user)
    end

    return number_of_pairings
  end

  def save_entire_pair(users=[])
    users.each do |user|
        pair_id = Pairing.maximum(:pair_id).to_i+1
        Pairing.create(pair_id: pair_id, user_id: user.id, cohort_id: user.cohort_id)
    end
  end

  def users_in_same_cohort_as(user)
    return User.where(cohort_id: user.cohort_id).find_each.to_a
  end

  def cohort_of_user(user)
    return Cohort.where(id: user.cohort_id).first
  end

  def remove_user(user_list, reject_user=nil)
    return user_list.reject { |user| user == reject_user }
  end

  def users_in_cohort(cohort)
    return User.where(cohort_id: cohort.id).find_each.to_a
  end

  def unpaired_users_today(cohort)
    return users_in_cohort(cohort).reject do |user|
      Pairing.where("created_at >= ? AND user_id = ?", Time.zone.now.beginning_of_day, user.id).first != nil
    end
  end

  # def assign_pairs(cohort_name)
  #   # this is a method used elsewhere
  #   # odd number should return a final pair of one person
  # end

end
