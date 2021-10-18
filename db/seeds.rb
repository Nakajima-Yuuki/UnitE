# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# user
user1 = User.create!(
    id: 1,
    username: "uk",
    email: "uk@g.com",
    password: "111111",
    admin: true,
  )
  user2 = User.create!(
    id: 2,
    username: "sano",
    email: "sano@g.com", 
    password: "111111",
  )
  user3 = User.create!(
    id: 3,
    username: "ken",
    email: "ken@g.com", 
    password: "111111",
  )
  user4 = User.create!(
    id: 4,
    username: "baji",
    email: "baji@g.com", 
    password: "111111",
  )
  user5 = User.create!(
    id: 5,
    username: "taka",
    email: "taka@g.com",
    password: "111111",
  )

#proposer
proposer1 = Proposer.create!(
    id: 1,
    name: "rewo",
    email: "rewo@g.com",
    password: "111111",
  )
proposer2 = Proposer.create!(
    id: 2,
    name: "chihuyu",
    email: "chihuyu@g.com",
    password: "111111",
  )
  proposer3 = Proposer.create!(
    id: 3,
    name: "shiba",
    email: "shiba@g.com",
    password: "111111",
  )
  proposer4 = Proposer.create!(
    id: 4,
    name: "maki",
    email: "maki@g.com",
    password: "111111",
  )
  proposer5 = Proposer.create!(
    id: 5,
    name: "asuka",
    email: "asuka@g.com",
    password: "111111",
  )

#投稿
outfit = Outfit.new(
    proposer_id: proposer1.id,
    title: "シャツコーデ",
    content: "オレンジのニットがポイント",
  )
  outfit1.image.attach(io: File.open(db/images/outfit01.jpeg), filename:"outfit01.jpeg")
  outfit1.save!

  outfit = Outfit.new(
    proposer_id: proposer2.id,
    title: "フーディーコーデ",
    content: "オーバーサイズがポイント",
  )
  outfit2.image.attach(io: File.open(db/images/outfit02.jpeg), filename:"outfit02.jpeg")
  outfit2.save!

  outfit = Outfit.new(
    proposer_id: proposer3.id,
    title: "ニットコーデ",
    content: "足元のコンバースが尚よし",
  )
  outfit3.image.attach(io: File.open(db/images/outfit03.jpeg), filename:"outfit04.jpeg")
  outfit3.save!

  outfit = Outfit.new(
    proposer_id: proposer4.id,
    title: "ストリートコーデ",
    content: "ニューバランスでスポーティーに",
  )
  outfit4.image.attach(io: File.open(db/images/outfit04.jpeg), filename:"outfit04.jpeg")
  outfit4.save!

  outfit = Outfit.new(
    proposer_id: proposer5.id,
    title: "ニットワンピコーデ",
    content: "柄で可愛く足元はストリートに！",
  )
  outfit4.image.attach(io: File.open(db/images/outfit05.jpeg), filename:"outfit05.jpeg")
  outfit4.save!