require 'rails_helper'


feature 'As a Pairmiscuous user' do

  before(:each) do
    User.create(username: "Molly")
    User.create(username: "Daryl")
    User.create(username: "Tim")
    User.create(username: 'Chidu')
  end

  scenario 'pair is shown' do
    visit users_path
    expect(page).to have_content("You are paired with Molly");
  end

  scenario 'accepting a pair' do
    sign_up('Rocco', 'rocco')
    click_link('Back')
    click_link('Accept')
    expect(page).to have_content('Rocco and Molly')
    expect(page).to have_content('Congratulations on pairing.')
  end

  xscenario 'no pairs available' do
    Pairing.create(pair_id: 1, user_id: 1)
    Pairing.create(pair_id: 1, user_id: 2)
    Pairing.create(pair_id: 2, user_id: 3)
    Pairing.create(pair_id: 2, user_id: 4)
    sign_up('Rocco', 'rocco')
    click_link('Back')
    expect(page).to have_content('Please speak to the coaches to find a pair')
  end


  def sign_up(username, name)
    visit new_user_path
    fill_in('Full name', with: name)
    fill_in('Username', with: username)
    click_button('Create User')
  end
end
