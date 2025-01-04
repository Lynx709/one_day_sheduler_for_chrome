class Schedule < ApplicationRecord
  # relation
  belongs_to :date_summary

  # validation
  validates :time, presence: true
  validates :weather, inclusion: { in: %w[sunny cloudy rainy], allow_nil: true }

  # enum
  enum weather: { sunny: 0, cloudy: 1, rainy: 2 }

  # scope
  
  # rogic
end
