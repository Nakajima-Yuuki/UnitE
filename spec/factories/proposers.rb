FactoryBot.define do
  factory :proposer do
    name { 'proposer01' }
    email { 'proposer01@gmail.com' }
    password { '111111' }
    password_confirmation { '111111' }
  end

  factory :proposer2, class: Proposer do
    name { 'proposer2' }
    email { 'proposer2@gmail.com' }
    password { '111111' }
    password_confirmation { '111111' }
  end
end
