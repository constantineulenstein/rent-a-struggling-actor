class Transaction < ApplicationRecord
  belongs_to :trademark
  belongs_to :user
end
