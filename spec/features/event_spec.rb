RSpec.describe 'Event', type: :feature do
  before(:all) do
    User.create(name: 'Felipe Rosa', username: 'flpfar')

    visit new_session_path
    fill_in 'session_username', with: 'flpfar'
    find("input[type='submit']").click
  end

  it 'should create a new event' do
    visit new_event_path
    fill_in 'event_title', with: 'Christmas'
    fill_in 'event_location', with: 'Belen'
    fill_in 'event_date', with: '2020-12-25'
    find("button[type='submit']").click
    expect(page).to have_content('Event Created')
  end
end
