require 'pairings_helper'

class WelcomeController < ApplicationController
  include PairingsHelper

  def index
    if current_user
      @list = pair_me(current_user)
      @next_pair = @list[0]
    end
  end
end
