class Enrollment < ApplicationRecord
  belongs_to :coordinator
  belongs_to :participant
  belongs_to :registry
  validates :participant, uniqueness: { scope: :registry, message: "has already been enrolled in this registry." }
end
