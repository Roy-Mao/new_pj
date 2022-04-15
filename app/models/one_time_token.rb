class OneTimeToken < ApplicationRecord
  belongs_to :person, foreign_key: true

  validates :token, presence: true
  # warning: here status presence: true wont work
  validates :status, inclusion: [true, false]
end
