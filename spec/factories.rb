require_relative 'support/factory_bot'
require_relative 'support/chrome'

FactoryBot.define do
  factory :user do
    name { 'Tom' }
    photo { 'https://unsplash.com/photos/F_-0BxGuVvo' }
    bio { 'Teacher from Mexico.' }
    postscounter { 3 }
  end

  factory :post do
    title { Faker::Lorem.sentence }
    text { Faker::Lorem.paragraph }
    association :author, factory: :user
    likescounter { rand(100) }
    commentscounter { rand(100) }
  end

  FactoryBot.define do
    factory :comment do
      author { Faker::Name.name }
      text { Faker::Lorem.sentence }
      post_id { post.id }
    end
  end

  FactoryBot.define do
    factory :like do
      association :author, factory: :user
      association :post
    end
  end
end
