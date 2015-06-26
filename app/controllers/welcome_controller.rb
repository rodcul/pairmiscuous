class WelcomeController < ApplicationController
  def index
    @user = User.first
  end



end
