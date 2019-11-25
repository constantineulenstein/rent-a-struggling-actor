class Transaction < ApplicationRecord
  belongs_to :trademark
  belongs_to :user
  validates :location, :date, :description, :user_id, :trademark_id, presence: true
  validates :user_id, uniqueness: { scope: :trademark_id}
end
