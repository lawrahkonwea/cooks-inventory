class User < ApplicationRecord
  has_many :inventories, foreign_key: 'user_id', dependent: :destroy
  has_many :recipes, foreign_key: 'user_id', dependent: :destroy
  has_many :foods
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :foods, foreign_key: :user_id
  has_many :inventories, foreign_key: :user_id
  has_many :recipes, foreign_key: :user_id
end
