module PairingsHelper

  # Return an array of potential partners in descending order of attractiveness
  def pair_me(primary_user)
    # Filter the available partners from the current cohort
    # Next version should filter users already paired for today in pair history

    available_users = users_in_same_cohort_as(primary_user)
    available_users = remove_user(available_users, primary_user)

    return available_users.shuffle

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

  def remove_user(user_list, reject_user=nil)
    return user_list.reject { |user| user == reject_user }
  end

  def users_in_cohort(cohort)
    return User.where(cohort_id: cohort.id).find_each.to_a
  end

  def unpaired_users_today(cohort)
    return users_in_cohort(cohort).reject do |user|
      Pairing.where(user_id: user.id, created_at: Date.today).first != nil
    end
  end

  # def assign_pairs(cohort_name)
  #   # this is a method used elsewhere
  #   # odd number should return a final pair of one person
  # end

end
