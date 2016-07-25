class Review < ApplicationRecord

  belongs_to :lease
  belongs_to :user
end
