require 'rails_helper'

RSpec.describe 'User posts view', type: :feature do
  before(:example) do
    @user = User.create(name: 'User1', photo: 'https://source.unsplash.com/user/c_v_r/100x100',
                        bio: 'Ruby on Rails enthusiast', postscounter: 2)
    @posts = 5.times.collect do |i|
      Post.create(title: "sample post #{i + 1}", text: 'Rails all the way', commentscounter: 0, likescounter: 0,
                  author_id: @user.id)
    end
    @post = @posts.first
    @comments = 7.times.collect do
      Comment.create(post_id: @post.id, author_id: @user.id, text: 'Ruby on Rails')
    end
    visit user_posts_path(@user)
  end

  it "displays the user's profile picture" do
    expect(page).to have_selector("img[src='#{@user.photo}']")
  end

  it "displays the user's username" do
    within('.name') do
      expect(page).to have_content(@user.name)
    end
  end

  it 'displays the number of posts the user has written' do
    expect(page).to have_content('Number of posts 7')
  end

  it "displays a post's title" do
    @posts.each do |_post|
      expect(page).to have_content(@post.title)
    end
  end

  it "displays some of the post's body" do
    @posts.each do |_post|
      expect(page).to have_content(@post.text)
    end
  end

  it 'displays the first comments on a post' do
    expect(page).to have_content(@post.comments.first.text)
  end

  it 'displays how many comments a post has' do
    expect(page).to have_content("Comments: #{@post.commentscounter}")
  end

  it 'displays how many likes a post has' do
    expect(page).to have_content("Likes: #{@post.likescounter}")
  end

  it 'Not to show the Pagination button' do
    expect(page.body).not_to include('Pagination')
  end

  it "redirects to the post's show page when clicking on a post" do
    click_link @post.title.to_s
    expect(current_path).to eq(user_post_path(@user, @post))
  end
end
