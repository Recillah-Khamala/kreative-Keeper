# require 'rails_helper'

# RSpec.describe Comment, type: :model do
#   describe "Validations" do
#     it { is_expected.to validate_presence_of(:author) }
#     it { is_expected.to validate_presence_of(:post) }
#     it { is_expected.to validate_presence_of(:content) }
#   end

#   describe "Associations" do
#     it { is_expected.to belong_to(:author).class_name("User") }
#     it { is_expected.to belong_to(:post) }
#   end

#   describe "#update_commentscounter" do
#     let(:comment) { create(:comment) }

#     it "increments the comments counter of the associated post" do
#       expect { comment.update_commentscounter }.to change { comment.post.commentscounter }.by(1)
#     end
#   end
# end
