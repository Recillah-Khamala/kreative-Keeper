require 'rails_helper'

RSpec.describe 'Specific User', type: :feature do
  describe 'Show Page' do
    before(:each) do
      @user1 = User.create! name: 'Tom', photo: 'https://source.unsplash.com/user/c_v_r/100x100', bio: 'Tom bio', postscounter: 0
      @user2 = User.create! name: 'Lilly', photo: 'https://i.picsum.photos/id/216/200/300.jpg?hmac', bio: 'Lilly bio', postscounter: 0
      @post1 = Post.create! title: 'Post 1', text: 'Post content goes here', commentscounter: 0, likescounter: 0, author_id: @user1.id
      @post2 = Post.create! title: 'Post 2', text: 'Post content goes here', commentscounter: 0, likescounter: 0, author_id: @user1.id
      @post3 = Post.create! title: 'Post 3', text: 'Post content goes here', commentscounter: 0, likescounter: 0, author_id: @user2.id
      @user1.save
      @user2.save
      @post1.save
      @post2.save
      @post3.save
      visit user_path(@user1)
    end

    it 'displays the user\'s profile picture' do
      expect(page).to have_css("img[src='#{@user1.photo}']")
    end

    it 'displays the user\'s username' do
      expect(page).to have_content(@user1.name)
    end

    it 'displays the number of posts the user has written' do
      expect(page).to have_content("Number of posts 4")
    end

    it 'displays the user\'s bio' do
      expect(page).to have_content(@user1.bio)
    end

    it 'displays the user\'s first 3 posts' do
      expect(page).to have_content(@post1.id)
      expect(page).to have_content(@post2.id)
      expect(page).not_to have_content(@post3.id)
    end

    it 'displays a button to view all of a user\'s posts' do
      expect(page).to have_link("See all posts", href: user_posts_path(@user1))
    end

    it 'redirects to a post\'s show page when clicking a post' do
      click_link(@post1.title)
      expect(page).to have_current_path(user_posts_path(@user1, @post1))
    end

    it 'redirects to the user\'s post index page when clicking the view all posts button' do
      click_link("See all posts", href: user_posts_path(@user1))
      expect(page).to have_current_path(user_posts_path(@user1))
    end
  end
end

