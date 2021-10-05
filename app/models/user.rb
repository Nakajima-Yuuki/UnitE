class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true #追記
  validates :profile, length: { maximum: 200 } #追記
  has_one_attached :avatar
  has_many :stocks, dependent: :destroy
end
