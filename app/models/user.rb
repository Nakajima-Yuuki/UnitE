class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, length: { maximum: 20 }
  validates :email, presence: true, length: { maximum: 50 }
  attr_accessor :current_password
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

  def update_without_current_password(params, *options)
    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update(params, *options)
    clean_up_passwords
    result
  end
end
