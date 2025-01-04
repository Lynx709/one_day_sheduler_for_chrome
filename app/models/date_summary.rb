class DateSummary < ApplicationRecord
  # relation
  has_many :schedules

  # validation
  validates :date, presence: true
  validates :complete_rate, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }

  # scope
  scope :on_date, ->(date) { where(date: date) }

  # rogic
end
