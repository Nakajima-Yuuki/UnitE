class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true #追記
  validates :profile, length: { maximum: 200 } #追記
  has_one_attached :avatar
  has_many :stocks, dependent: :destroy
  has_many :likes, dependent: :destroy
  
  def liked_by?(outfit_id)
    likes.where(outfit_id: outfit_id).exists?
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.username = 'ゲスト'
      user.password = SecureRandom.urlsafe_base64
    end
  end

  def self.admin_guest
    find_or_create_by!(email: 'admin@gmail.com') do |user|
      user.username = "ゲスト管理者"
      user.password = SecureRandom.urlsafe_base64
      user.admin = true
    end
  end
end
