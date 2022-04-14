class Person < ApplicationRecord
  # TODO: refactor to person_form object for reuse
  validates :name, length: { minimum: 1, maximum: 32 }, allow_nil: true

  validates :phone_number, numericality: true, length: { minimum:10, maximum: 12 }, uniqueness:true, presence: true

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create, message: "invalid email" },
  uniqueness: { case_sensitive: false }, length: { minimum: 5, maximum: 128 }, allow_nil: true

  validate :available_date_must_be_in_the_future

  validates :user_type, presence: true, numericality: { only_integer: true }, allow_nil: true

  # warning: this will generate a instance method "child?", raise_conflict_error
  enum :user_type, [ :child_type, :adult_type, :parent_type ]

  def available_date_must_be_in_the_future
    errors.add(:available_on, "can't be in the past") if !available_on.nil? && available_on < Date.today
  end
  end
end
