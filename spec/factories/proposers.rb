FactoryBot.define do
  factory :proposer do
    name { 'Proposer01' }
    email { 'proposer01@example.com' }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
