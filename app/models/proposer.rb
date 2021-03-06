class Proposer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :name, presence: true, length: { maximum: 20 }
  validates :email, presence: true, length: { maximum: 50 }
  attr_accessor :current_password
  has_one_attached :avatar
  has_many :outfits, dependent: :destroy

  def self.guest
    find_or_create_by!(email: 'guest_proposer@example.com') do |proposer|
      proposer.name = 'ゲストファッショニスタ'
      proposer.password = SecureRandom.urlsafe_base64
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
