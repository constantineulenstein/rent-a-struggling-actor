class User < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_many :transactions, dependent: :destroy
  has_many :trademarks, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, :first_name, :last_name, presence: true
  validates :username, uniqueness: true
end
