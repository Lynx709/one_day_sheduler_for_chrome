class Setting < ApplicationRecord
  # validation
  validates :time_interval, inclusion: { in: [30, 60, 120] }
  validates :start_time, presence: true
  validates :end_time, presence: true

  # scope
  
  # rogic
end
