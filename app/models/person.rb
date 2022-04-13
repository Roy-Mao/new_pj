class Person < ApplicationRecord
  # validation filed
  # TODO: refactor to person_form object for reuse
  # TODO: name 1-32
  # set default name value
  validates :name, presence: true
  # TODO: verify phone number
  validates :phone_number, presence: true
  # TODO: check if it is email using regular expression to check
  validates :email, uniqueness: true, presence: true
  # TODO: change timedate to date
  validates :available_on, presence: true
  # todo: refactor to use enum
  validates :user_type, presence: true, numericality: { only_integer: true }

  # warning: this will generate a instance method "child?", raise_conflict_error
  enum :user_types, [ :child_type, :adult_type, :parent_type ]
end
