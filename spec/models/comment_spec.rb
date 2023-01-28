require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:all) do
    @user = User.new(name: 'first_user', postscounter: 0)
    @user.save

    @post = Post.new(title: 'Rails', text: 'Validations in ruby on rails', commentscounter: 0, likescounter: 0,
                     author: @user)
    @post.save
  end

  subject { Comment.new(text: 'Lets see if commenting work', author: @user, post: @post) }

  before { subject.save }

  it 'comments shoulld be increment by 1' do
    expect(subject.post.commentscounter).to eq(1)
  end

  it 'cannot update comments counter because it is a private method' do
    expect(subject).not_to respond_to(:update_commentscount)
  end
end
