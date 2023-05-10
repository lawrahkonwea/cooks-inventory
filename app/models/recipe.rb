class Recipe < ApplicationRecord
  has_many :recipes
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
