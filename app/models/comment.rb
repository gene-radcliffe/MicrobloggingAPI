class Comment < ApplicationRecord
  belongs_to :proclamation
  belongs_to :user
end
