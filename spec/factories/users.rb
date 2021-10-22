FactoryBot.define do
  factory :user1, class:User do
    username { 'user1' }
    email { 'user1@gmail.com' }
    password { '111111' }
    password_confirmation { '111111' }
    admin { false }
  end

  factory :user2, class: User do
    username { 'user2' }
    email { 'user2@gmail.com' }
    password { '111111' }
    password_confirmation { '111111' }
    admin { false }
  end

  factory :admin_user, class: User do
    username { 'admin' }
    email { 'admin@gmail.com' }
    password { '111111' }
    password_confirmation { '111111' }
    admin { true }
  end
end
