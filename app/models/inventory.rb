class Inventory < ApplicationRecord
  belongs_to :user

  has_many :inventory_foods
  validates :name, presence: true, length: { maximum: 250 }

  def self.created_by_current_user(current_user)
    where(user_id: current_user).order(created_at: :desc)
  end
end
