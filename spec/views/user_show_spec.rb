require 'rails_helper'
require 'data/test_data'
require 'capybara'

RSpec.describe 'User show page', type: :feature do
  include FakerData
  before(:each) do
    fetch_data
  end
  before do
    visit user_path(@user1)
  end

  let!(:post11) do
    Post.create(id: 77, title: 'This is my Post Number 11', text: 'My post', author_id: @user1.id, comments_counter: 0,
                likes_counter: 0)
  end

  it 'displays the user\'s profile picture' do
    expect(page).to have_css('img.profile_img')
  end

  it 'displays the user\' username' do
    expect(page).to have_content('Bruno')
  end

  it 'displays the number of posts the user has written' do
    expect(page).to have_content('Number of posts: 1')
  end

  it 'displays the user\' bio' do
    expect(page).to have_content('Bio')
    expect(page).to have_content('This is my bio')
  end

  it 'displays the first 3 posts' do
    expect(page).to have_content('Post 1')
    expect(page).to have_content('Post 2')
    expect(page).to have_content('Post 3')
  end

  it "displays a button to view all of a user's posts" do
    expect(page).to have_link('See all posts', href: user_posts_path(@user1))
  end

  it 'redirects to a user\'s post show page when clicking on a users post' do
    visit user_path(@user1)
    click_link 'This is my Post Number 11'
    expect(current_path).to eq(user_post_path(@user1, post11))
  end

  it 'redirects to the user post index page when clicking on "See all posts"' do
    visit user_path(@user1)
    click_link('See all posts')
    expect(current_path).to eq(user_posts_path(@user1))
  end
end
