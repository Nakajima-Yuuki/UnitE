class Stock < ApplicationRecord
  belongs_to :user
  belongs_to :outfit

  validates :user_id, presence: true
  validates :outfit_id, presence: true
end
