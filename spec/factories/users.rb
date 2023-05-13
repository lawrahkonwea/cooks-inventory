FactoryBot.define do
  factory :user do
    name { 'Big Bill' }
    email { 'big@bill.com' }
    password { '123456' }
    confirmed_at { nil }
  end
end
