class Coordinator < ApplicationRecord
  has_many :enrollments
  has_many :participants, through: :enrollments
  has_many :registries, through: :enrollments
  validates :email, presence: true, uniqueness: true
end