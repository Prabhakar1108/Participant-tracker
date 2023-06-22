class Registry < ApplicationRecord
  has_many :enrollments
  has_many :participants, through: :enrollments
  has_many :coordinators, through: :enrollments
  enum status: [:close, :open]
end