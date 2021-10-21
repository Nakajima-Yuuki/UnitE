FactoryBot.define do
  factory :outfit do
    association :proposer
    title { 'test_title' }
    content { 'test_content' }
    
    after(:build) do |outfit|
      outfit.image.attach(io: File.open('./spec/images/outfit04.jpeg'), filename: 'outfit04.png')
    end
  end
end
