require_relative '../rails_helper.rb'

RSpec.describe 'User', type: :feature do
  before(:all) do
    User.create(name: 'Sergio Zambrano', username: 'sergiomauz')
  end

  it 'It should create a new user without fails' do
    visit new_user_path
    fill_in 'user_name', with: 'Selene Perez'
    fill_in 'user_username', with: 'selene'
    find("button[type='submit']").click
    expect(page).to have_content('User Created')
  end

  it 'It should NOT create a new user with same username' do
    visit new_user_path
    fill_in 'user_name', with: 'Selene Perez'
    fill_in 'user_username', with: 'selene'
    find("button[type='submit']").click
    expect(page).to have_content('Failed to create user')
  end

  it 'It should log in with the last created user' do
    visit new_session_path
    fill_in 'session_username', with: 'sergiomauz'
    find("input[type='submit']").click
    expect(page).to have_content('Logged in')
  end
end
