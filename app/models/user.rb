class User < ApplicationRecord
  has_many :recipes, dependent: :destroy
  validates :email, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
