class MatrixController < ApplicationController

  include MatrixHelper

  def index
    c = Cohort.find_by(name: '#april2015')
    @users = User.where(cohort_id: c.id)
    @matrix = populate_entire_matrix('#april2015')
  end

end
