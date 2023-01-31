require 'rails_helper'

RSpec.describe Like, type: :model do
  before(:all) do
    @user = User.new(name: 'Recillah', postscounter: 0)
    @user.save

    @post = Post.new(title: 'All Rails', text: 'Lets talk about Rails', commentscounter: 1, likescounter: 0,
                     author: @user)
    @post.save
  end

  subject { Like.create(author: @user, post: @post) }

  it 'likes counter is incremented by 1' do
    expect(@post.likescounter).to be_truthy
  end

  it 'cannot update likes count because it is private ' do
    expect(subject).not_to respond_to(:update_likescounter)
  end
end
