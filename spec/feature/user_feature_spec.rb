require 'rails_helper'

feature 'As a Pairmiscuous user' do

  before(:each) do
    User.create(username: "Molly")
    User.create(username: "Rocco")
    User.create(username: "Tim")
  end

  scenario 'pair is shown' do
    visit users_path
    expect(page).to have_content("You are paired with Molly");
  end
end