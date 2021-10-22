class Proposer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :name, presence: true, length: { maximum: 20 }
  validates :email, presence: true, length: { maximum: 50 }
  validates :password, presence: true, length: { maximum: 50 }
  has_one_attached :avatar
  has_many :outfits, dependent: :destroy

  def self.guest
    find_or_create_by!(email: 'guest_proposer@example.com') do |proposer|
      proposer.name = 'ゲストファッショニスタ'
      proposer.password = SecureRandom.urlsafe_base64
    end
  end
end
