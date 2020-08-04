class Task < ApplicationRecord
  # associations -- not today: only one model
  # validations
  validates :title, presence: true
end
