FactoryBot.define do
  factory :user do
    username { 'User01' }
    email { 'user01@example.com' }
    password { 'password' }
    password_confirmation { 'password' }
    admin { false }
  end
  factory :admin_user, class: User do
    username { 'Admin01' }
    email { 'admin01@example.com' }
    password { 'password' }
    password_confirmation { 'password' }
    admin { true }
  end
end
