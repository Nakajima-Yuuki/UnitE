# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# user
user1 = User.create!(
    username: "管理者",
    email: "admin_user@g.com",
    password: "111111",
    admin: true,
  )
  user2 = User.create!(
    username: "sano",
    email: "sano@g.com", 
    password: "111111",
  )
  user3 = User.create!(
    username: "ken",
    email: "ken@g.com", 
    password: "111111",
  )
  user4 = User.create!(
    username: "baji",
    email: "baji@g.com", 
    password: "111111",
  )
  user5 = User.create!(
    username: "taka",
    email: "taka@g.com",
    password: "111111",
  )

#proposer
proposer1 = Proposer.create!(
    name: "uk",
    email: "uk@g.com",
    password: "111111",
  )
proposer2 = Proposer.create!(
    name: "chihuyu",
    email: "chihuyu@g.com",
    password: "111111",
  )
  proposer3 = Proposer.create!(
    name: "shiba",
    email: "shiba@g.com",
    password: "111111",
  )
  proposer4 = Proposer.create!(
    name: "maki",
    email: "maki@g.com",
    password: "111111",
  )
  proposer5 = Proposer.create!(
    name: "asuka",
    email: "asuka@g.com",
    password: "111111",
  )
  proposer6 = Proposer.create!(
    name: "deku",
    email: "deku@g.com",
    password: "111111",
  )
  proposer7 = Proposer.create!(
    name: "shota",
    email: "shota@g.com",
    password: "111111",
  )
  proposer8 = Proposer.create!(
    name: "nara",
    email: "nara@g.com",
    password: "111111",
  )
  proposer9 = Proposer.create!(
    name: "hase",
    email: "hase@g.com",
    password: "111111",
  )
  proposer10 = Proposer.create!(
    name: "Lisa",
    email: "Lisa@g.com",
    password: "111111",
  )
  proposer11 = Proposer.create!(
    name: "jun",
    email: "jun@g.com",
    password: "111111",
  )
  proposer11 = Proposer.create!(
    name: "saya",
    email: "saya@g.com",
    password: "111111",
  )

  proposer12 = Proposer.create!(
    name: "non",
    email: "non@g.com",
    password: "111111",
  )
#投稿

outfit1 = Outfit.new(
    proposer_id: proposer1.id,
    title: "シャツコーデ",
    content: "オレンジのニットがポイント"
  )
  outfit.image.attach(
    io: File.open(Rails.root.join('db', 'images', 'outfit01.jpeg')),
    filename:"outfit01.jpeg"
  )
  outfit.save!

  outfit2 = Outfit.new(
    proposer_id: proposer2.id,
    outfit_id: outfit2.id,
    title: "フーディーコーデ",
    content: "オーバーサイズがポイント",
  )
  outfit.image.attach(
    io: File.open(Rails.root.join('db', 'images', 'outfit02.jpeg')),
    filename:"outfit02.jpeg"
    )
  outfit.save!

  outfit3 = Outfit.new(
    proposer_id: proposer3.id,
    title: "ニットコーデ",
    content: "足元のコンバースが尚よし",
  )
  outfit.image.attach(
    io: File.open(Rails.root.join('db', 'images', 'outfit03.jpeg')),
    filename:"outfit03.jpeg"
    )
  outfit.save!

  outfit4 = Outfit.new(
    proposer_id: proposer4.id,
    title: "ストリートコーデ",
    content: "ニューバランスでスポーティーに",
  )
  outfit.image.attach(
    io: File.open(Rails.root.join('db', 'images', 'outfit04.jpeg')),
    filename:"outfit04.jpeg"
  )
  outfit.save!

  outfit5 = Outfit.new(
    proposer_id: proposer5.id,
    title: "ニットワンピコーデ",
    content: "柄で可愛く足元はストリートに！",
  )
  outfit.image.attach(
    io: File.open(Rails.root.join('db', 'images', 'outfit05.jpeg')),
    filename:"outfit05.jpeg"
    )
  outfit.save!
  
  outfit6 = Outfit.new(
    proposer_id: proposer6.id,
    title: "ロングコートコーデ",
    content: "綺麗目＆ストリート！",
  )
  outfit.image.attach(
    io: File.open(Rails.root.join('db', 'images', 'outfit06.jpeg')),
    filename:"outfit06.jpeg"
    )
  outfit.save!

  outfit7 = Outfit.new(
    proposer_id: proposer7.id,
    title: "ロングコートコーデ",
    content: "綺麗目＆ストリート！",
  )
  outfit.image.attach(
    io: File.open(Rails.root.join('db', 'images', 'outfit07.jpeg')),
    filename:"outfit07.jpeg"
    )
  outfit.save!

  outfit8 = Outfit.new(
    proposer_id: proposer8.id,
    title: "キルティングブルゾンコーデ",
    content: "差し色に黄色でメリハリをつけました",
  )
  outfit.image.attach(
    io: File.open(Rails.root.join('db', 'images', 'outfit08.jpeg')),
    filename:"outfit08.jpeg"
    )
  outfit.save!

  outfit9 = Outfit.new(
    proposer_id: proposer9.id,
    title: "フーディーコーデ",
    content: "差し色に黄色でメリハリをつけました",
  )
  outfit.image.attach(
    io: File.open(Rails.root.join('db', 'images', 'outfit09.jpeg')),
    filename:"outfit09.jpeg"
    )
  outfit.save!

  outfit10 = Outfit.new(
    proposer_id: proposer10.id,
    title: "シンプルコーデ",
    content: "ボーダーのL/S、Tシャツで小洒落感",
  )
  outfit.image.attach(
    io: File.open(Rails.root.join('db', 'images', 'outfit10.jpeg')),
    filename:"outfit010.jpeg"
    )
  outfit.save!

  outfit11 = Outfit.new(
    proposer_id: proposer11.id,
    title: "レイヤードニットコーデ",
    content: "キレイめコーデにしてみました。",
  )
  outfit.image.attach(
    io: File.open(Rails.root.join('db', 'images', 'outfit11.jpeg')),
    filename:"outfit011.jpeg"
    )
  outfit.save!

  outfit12 = Outfit.new(
    proposer_id: proposer12.id,
    title: "ラッフルデザインニットコーデ",
    content: "キレイめコーデにしてみました。",
  )
  outfit.image.attach(
    io: File.open(Rails.root.join('db', 'images', 'outfit12.jpeg')),
    filename:"outfit012.jpeg"
    )
  outfit.save!

  #いいね
  5.times do |n|
    Like.create!(
    outfit_id: "#{n + 1}",
    user_id: "#{n + 1}"
    )
  end

  #保存

    Stock.create!(
      user_id: user1.id,
      outfit_id: outfit1.id,
    )
  
    Stock.create!(
      user_id: user2.id,
      outfit_id: outfit2.id,
    )
  
    Stock.create!(
      user_id: user4.id,
      outfit_id: outfit4.id,
    )
  
    Stock.create!(
      user_id: user5.id,
      outfit_id: outfit3.id,
    )
  
    Stock.create!(
      user_id: user1.id,
      outfit_id: outfit5.id,
    )