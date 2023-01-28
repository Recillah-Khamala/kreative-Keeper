require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_most(250) }
    it { should validate_numericality_of(:commentscounter).only_integer.is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:likescounter).only_integer.is_greater_than_or_equal_to(0) }
  end

  describe 'associations' do
    it { should belong_to(:author).class_name('User') }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
  end

  describe 'Methods' do
    describe '#recent_comments' do
      before { subject.save }
      it 'should return the most recent comments' do
        expect(subject.recent_comments).to eq(subject.comments.order(created_at: :desc).limit(5))
      end
    end
  end

  describe 'Callbacks' do
    describe 'after_save' do
      context 'when a post is saved' do
        it 'increments the author postscounter' do
          expect { subject.save }.to change { subject.author.postscounter }.by(1)
        end
      end
    end
  end
end



