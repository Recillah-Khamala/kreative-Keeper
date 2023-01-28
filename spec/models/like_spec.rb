# require 'rails_helper'

# RSpec.describe Like, type: :model do
#   describe "Validations" do
#     it { is_expected.to validate_presence_of(:author) }
#     it { is_expected.to validate_presence_of(:post) }
#   end

#   describe "Associations" do
#     it { is_expected.to belong_to(:author).class_name("User") }
#     it { is_expected.to belong_to(:post) }
#   end

#   describe "#update_likescounter" do
#     let(:like) { create(:like) }

#     it "increments the likes counter of the associated post" do
#       expect { like.update_likescounter }.to change { like.post.likescounter }.by(1)
#     end
#   end
# end
