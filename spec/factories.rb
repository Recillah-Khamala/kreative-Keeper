require_relative 'support/factory_bot'
require_relative 'support/chrome'

FactoryBot.define do
  factory(:user) do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end
