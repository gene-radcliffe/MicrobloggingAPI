class Proclamation < ApplicationRecord
  validates :body, length: { in: 2..280 }
  belongs_to :user
  has_many :comments
end
