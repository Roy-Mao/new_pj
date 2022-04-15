# waring: maybe the class name should be changed to contact_user
class Person < ApplicationRecord
  
  has_one :one_time_token

  validates :name, length: { in: 1..32 }, allow_nil: true

  validates :phone_number, numericality: true, length: { in: 10..12 }, uniqueness:true, presence: true

  validates :user_type, presence: true, numericality: { only_integer: true }, allow_nil: true

  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/, message: "invalid email", allow_nil: true

  validate :available_date_must_be_in_the_future

  # warning: this will generate a instance method "child?", raise_conflict_error
  enum :user_type, [ :child_type, :adult_type, :parent_type ]

  def available_date_must_be_in_the_future
    errors.add(:available_on, "can't be in the past") if !available_on.nil? && available_on < Date.today
  end

  def self.search(name_condition)
    # warning: "" or nil
    if name_condition.present?
      Person.where(name: name_condition)
    else
      Person.all
    end
  end
end
