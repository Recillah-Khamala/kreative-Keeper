require_relative 'support/factory_bot'
require_relative 'support/chrome'

FactoryBot.define do
  factory :user do
    sequence(:id) do |n|
      User.maximum(:id).to_i + n
    end
    name { Faker::Name.name }
    photo { Faker::LoremFlickr.image }
    bio { Faker::Lorem.paragraph }
    postscounter { Faker::Number.between(from: 1, to: 10) }
    after(:create) do |user, evaluator|
      create_list(:post, evaluator.postscounter, user:)
    end
  end

  factory :post do
    sequence(:id) do |n|
      Post.maximum(:id).to_i + n
    end
    title { Faker::Lorem.sentence }
    text { Faker::Lorem.paragraph }
    author_id { user.id }
    likescounter { 0 }
    after(:create) do |post, evaluator|
      create_list(:like, evaluator.likescounter, post:)
    end
    commentscounter { 0 }
    after(:create) do |post, evaluator|
      create_list(:comment, evaluator.commentscounter, post:)
    end
  end

  factory :comment do
    author { Faker::Name.name }
    text { Faker::Lorem.sentence }
    association :author, factory: :user
    association :post
  end

  factory :like do
    association :author, factory: :user
    association :post
  end
end
