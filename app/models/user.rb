class User < ApplicationRecord
  has_many :bills
  has_many :items
end
