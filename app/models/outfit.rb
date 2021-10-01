class Outfit < ApplicationRecord
    validates :title, presence: true
    validates :content, presence: true
    belongs_to :proposer
    has_many_attached :image
end
