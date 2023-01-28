require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:all) do
    @user = User.new(name: 'Recillah', photo: 'today_rails.png', bio: 'Example of my bio', postscounter: 0)
    @user.save
  end

  subject do
    Post.new(author: @user, title: 'Hello', text: 'Hello Rails', commentscounter: 0, likescounter: 0)
  end

  it 'title should present' do
    expect(subject).to be_valid
  end

  it 'title should not be valid if nil' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title should be valid if total word count is less than 250' do
    subject.title = 'Hello Rails'
    expect(subject).to be_valid
  end

  it 'title should invalid if is greater than  250' do
    subject.title = 'Hello Rails' * 100
    expect(subject).to_not be_valid
  end

  it 'comment counter should be valid if its 2' do
    subject.commentscounter = 2
    expect(subject).to be_valid
  end

  it 'comment counter should not be valid if its not an integer' do
    subject.commentscounter = 'one'
    expect(subject).to_not be_valid
  end

  it 'comment counter should not be valid if its -1' do
    subject.commentscounter = -1
    expect(subject).to_not be_valid
  end

  it 'likes counter should be valid if its a number' do
    subject.likescounter = 7
    expect(subject).to be_valid
  end

  it 'like counter should not be valid if its not an integer' do
    subject.likescounter = 'one'
    expect(subject).to_not be_valid
  end

  it 'method not to work because it is a private method' do
    expect(subject).not_to respond_to(:update_postscounter)
  end

  it 'Method should return false' do
    expect(subject.recent_comments.length).to be 0
  end
end
