require 'pairings_helper'

class WelcomeController < ApplicationController
  include PairingsHelper

  def index
    pair_me(current_user)
    @next_pair = @list_of_users[0]
  end
end
