module PairingsHelper

  # Return an array of potential partners in descending order of attractiveness
  def pair_me(primary_user, cohort, cohort_pair_history = [])
    # Filter the available partners from the current cohort
    # Next version should filter users already paired for today in pair history
    cohort_users = User.where(cohort_id: cohort.id).find_each.to_a
    available_users = cohort_users.reject do |user|
      user == primary_user
    end

    return available_users.shuffle

  end

  # def assign_pairs(cohort_name)
  #   # this is the method used elsewhere
  #   # odd number should return a final pair of one person
  # end

end
