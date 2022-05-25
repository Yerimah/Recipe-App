class Food < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :unit, :price, presence: true,
                           numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  has_many :recipe_foods, dependent: :destroy
end
