require 'rails_helper'
require 'data/test_data'

RSpec.describe 'User index page', type: :system do
  include FakerData
  before(:each) do
    fetch_data
  end
  before do
    @user = User.create(name: 'Paolo', photo: 'https://photos.jpg', bio: 'Eng')
  end

  it 'shows the username of all users' do
    visit users_path
    expect(page).to have_content(@user1.name)
    expect(page).to have_content(@user2.name)
    expect(page).to have_content(@user3.name)
    expect(page).to have_content(@user4.name)
  end

  it 'Shows the profile picture for each user' do
    visit users_path
    expect(page).to have_css("img.user_avatar[src*='https://photos.jpg']")
    expect(page).to have_css("img.user_avatar[src*='https://photos.jpg']")
  end

  it 'Shows the number of posts' do
    visit users_path
    expect(page).to have_content('Number of posts: 2')
    expect(page).to have_content('Number of posts: 1')
  end

  it "Redirected user's show page When user is clicked" do
    visit users_path
    click_link @user4.name
    expect(page).to have_current_path(user_path(@user4))
  end
end
