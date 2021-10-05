class Outfit < ApplicationRecord
    validates :title, presence: true
    validates :content, presence: true
    belongs_to :proposer
    has_many_attached :image
    has_many :stocks, dependent: :destroy
    has_many :stocks_users, through: :stocks, source: :user
end
