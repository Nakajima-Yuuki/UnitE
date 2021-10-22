FactoryBot.define do
  factory :outfit do
    association :proposer
    title { 'test_title' }
    content { 'test_content' }
    
    after(:build) do |outfit|
      outfit.image.attach(io: File.open('./spec/images/outfit04.jpeg'), filename: 'outfit04.png')
    end
  end

  factory :outfit2, class: Outfit do
    association :proposer
    title { 'test_title2' }
    content { 'test_content2' }
    
    after(:build) do |outfit|
      outfit.image.attach(io: File.open('./spec/images/outfit08.jpeg'), filename: 'outfit08.png')
    end
  end
end
