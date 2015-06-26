require 'rails_helper'


feature 'As a Pairmiscuous user' do

  before(:each) do
    User.create(username: "Molly")
    User.create(username: "Rocco")
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

  scenario 'no pairs available' do
    sign_up('Rocco', 'rocco')
    click_link('Back')


  def sign_up(username, name)
    visit new_user_path
    fill_in('Full name', with: name)
    fill_in('Username', with: username)
    click_button('Create User')
  end
end
