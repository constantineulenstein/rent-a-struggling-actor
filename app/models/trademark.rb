class Trademark < ApplicationRecord
  belongs_to :user
  has_many :transactions
  validates :skill, presence: true
  validates :skill, uniqueness: { scope: :user_id}
end
