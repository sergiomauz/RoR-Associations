require 'rails_helper'

RSpec.describe "User", type: :feature do
  before(:all) do
    User.create(name: 'Sergio Zambrano', username: 'sergiomauz')
  end

  it "It should create a new user without fails" do
    visit new_user_path
    fill_in 'user_name', with: 'Selene Perez'
    fill_in 'user_username', with: 'selene'
    find("button[type='submit']").click    
    expect(page).to have_content('User Created')
  end

  it "It should log in with the last created user" do
    visit new_session_path    
    fill_in 'session_username', with: 'sergiomauz'
    find("input[type='submit']").click
    expect(page).to have_content('Logged in')
  end

  it "It should log in with the last created user" do
    visit new_session_path    
    fill_in 'session_username', with: 'sergiomauz'
    find("input[type='submit']").click
    
    visit new_event_path
    fill_in 'event_title', with: 'Christmas'
    fill_in 'event_location', with: 'Belen'
    fill_in 'event_date', with: '2020-12-25'
    find("button[type='submit']").click
    expect(page).to have_content('Event Created')    
  end  

end