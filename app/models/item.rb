class Item < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :bills
end
