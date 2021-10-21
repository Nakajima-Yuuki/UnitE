FactoryBot.define do
  factory :outfit do
    title { 'タイトル01' }
    content { '内容01' }
    
    after(:build) do |outfit|
      outfit.image.attach  io: File.open(Rails.root.join('spec', 'images', 'outfit04.jpeg')),filename:"outfit04.jpeg"
    end
  end
end
