require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_numericality_of(:postscounter).only_integer.is_greater_than_or_equal_to(0) }
  end

  describe 'associations' do
    it { should have_many(:posts).with_foreign_key('author_id') }
    it { should have_many(:comments).with_foreign_key('author_id') }
    it { should have_many(:likes).with_foreign_key('author_id') }
  end

  describe '#recent_posts' do
    it 'returns the 3 most recent posts for the user' do
      user = create(:user)
      post1 = create(:post, author: user)
      post2 = create(:post, author: user)
      post3 = create(:post, author: user)
      post4 = create(:post, author: user)

      expect(user.recent_posts).to eq([post4, post3, post2])
    end
  end
end