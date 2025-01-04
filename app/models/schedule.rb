class Schedule < ApplicationRecord
  # relation
  belogns_to :date_summary

  # validation
  validates :time, presence: true
  validates :weather, inclusion: { in: weather.keys.map(&:to_s), allow_nil: true }

  # enum
  enum weather: { sunny: 0, cloudy: 1, rainy: 2 }

  # scope
  
  # rogic
end
