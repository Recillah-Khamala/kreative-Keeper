require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Recillah', photo: 'today_rails.png', bio: 'Example of my bio', postscounter: 0) }

  describe 'validation checks' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is invalid without a name' do
      subject.name = nil
      expect(subject.valid?).to be false
    end

    it 'is invalid with non-integer post counter' do
      subject.postscounter = 'one'
      expect(subject.valid?).to be false
    end

    it 'is valid with post counter of 0' do
      subject.postscounter = 0
      expect(subject).to be_valid
    end

    it 'is invalid with post counter of -1' do
      subject.postscounter = -1
      expect(subject.valid?).to be false
    end

    describe 'recent post' do
      it 'returns 0 for user with no posts' do
        postscounter = subject.recent_posts.count
        expect(postscounter).to eq(0)
      end
    end

    it 'Post counter should be an integer' do
      expect(subject.postscounter).to be_a_kind_of(Numeric)
    end
  end
end
