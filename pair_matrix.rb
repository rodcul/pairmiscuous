def find_pairs(user_id)
  result = [[]]
  u = User.find(user_id)
  u.pairings.each do |x|
    Pairing.where(pair_id: x.pair_id).find_each do |p|
      result.last << p
      if result.last.length == 2
        result.push([])
      end
    end
  end
  result
end

def find_all_pairs(cohort_name)
  result = [[]]
  c = Cohort.find_by(name: cohort_name)
  users = User.where(cohort_id: c.id)
  users.each do |u|
    u.pairings.each do |x|
      Pairing.where(pair_id: x.pair_id).find_each do |p|
        result.last << p
        if result.last.length == 2
          result.push([])
        end
      end
    end
  end
  result.uniq
end

# to create empty matrix

def empty_matrix(cohort_name)
  c = Cohort.find_by(name: cohort_name)
  matrix = Array.new(c.users.length)
  matrix.map! { |x| x = Array.new(c.users.length) }
  matrix.each { |array| array.map! { |x| x = 0 } }
  matrix
end

def populate_entire_matrix(cohort_name)
  matrix = empty_matrix(cohort_name)
  all_pairs = find_all_pairs(cohort_name)

  all_pairs.each do |pair|
    if !pair.empty?
      matrix[pair[0].user_id - 1][pair[1].user_id - 1] += 1
    end
  end
  matrix
end

def populate_matrix(user_id, cohort_name)
  @matrix = empty_matrix(cohort_name)
  all_pairs = find_pairs(user_id)

  all_pairs.each do |pair|
    if !pair.empty?
      matrix[pair[0].user_id - 1][pair[1].user_id - 1] += 1
      pair.reverse!
      matrix[pair[0].user_id - 1][pair[1].user_id - 1] += 1
    end
  end
  @matrix
end
