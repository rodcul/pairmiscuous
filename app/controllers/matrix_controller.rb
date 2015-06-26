class MatrixController < ApplicationController

  include MatrixHelper

  def index
    cohort_name = params[:cohort] || Cohort.first.name
    @cohort = Cohort.find_by(name: cohort_name)
    @users = User.where(cohort_id: @cohort.id)
    @matrix = populate_entire_matrix(cohort_name)
  end

end
