class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :user
  validates :title, presence: true
  validates :description, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
