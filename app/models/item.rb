class Item < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :bills

  validates :name, presence: true
  validates :amount, presence: true, numericality: { only_integer: true }
end
