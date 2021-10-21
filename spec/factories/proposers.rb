FactoryBot.define do
  factory :proposer do
    name { 'proposer01' }
    email { 'proposer01@gmail.com' }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
