class Participant < ApplicationRecord
  has_many :enrollments
  has_many :coordinators, through: :enrollments
  has_many :registries, through: :enrollments
  validates :name, uniqueness: { scope: :registries, message: "has already been enrolled in this registry." }
end
