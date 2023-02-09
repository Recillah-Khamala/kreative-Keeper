require 'rails_helper'

RSpec.describe 'Posts view', type: :feature do
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
    visit user_posts_path(@user, @post)
  end

  it "displays the post's title" do
    expect(page).to have_content(@post.title)
  end

  it 'displays who wrote the post' do
    expect(page).to have_content(@post.author.name)
  end

  it 'displays how many comments the post has' do
    expect(page).to have_content('Comments: 7,')
  end

  it 'displays how many likes the post has' do
    expect(page).to have_content('Likes: 0')
  end

  it 'displays the post body' do
    expect(page).to have_content(@post.text)
  end

  it 'displays the username of each commentor' do
    @comments.each do |comment|
      expect(page).to have_content("#{comment.author.name}:")
    end
  end

  it 'displays the comment each commentor left' do
    @comments.each do |comment|
      expect(page).to have_content(comment.text)
    end
  end
end
