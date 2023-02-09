require 'rails_helper'

RSpec.describe 'User index page', type: :feature do
  before(:each) do
    @user1 = User.create! name: 'Tom',
                          photo: 'https://source.unsplash.com/user/c_v_r/100x100',
                          bio: 'Tom bio',
                          postscounter: 2
    @user2 = User.create! name: 'Lilly',
                          photo: 'https://source.unsplash.com/user/c_v_r/100x100',
                          bio: 'Lilly bio',
                          postscounter: 7
    visit users_path
  end

  it 'displays the username of all other users' do
    [@user1, @user2].each do |user|
      expect(page).to have_content(user.name)
    end
  end

  it 'displays the profile picture for each user' do
    [@user1, @user2].each do |user|
      expect(page).to have_selector("img[src='#{user.photo}']")
    end
  end

  it 'displays the number of posts each user has written' do
    [@user1, @user2].each do |user|
      expect(page).to have_content("Number of posts #{user.postscounter}")
    end
  end

  it 'redirects to the user show page when a user is clicked' do
    first(:link, @user1.name).click
    expect(current_path).to eq(user_path(@user1))
  end
end
