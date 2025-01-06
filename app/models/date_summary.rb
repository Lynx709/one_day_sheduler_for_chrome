class DateSummary < ApplicationRecord
  # relation
  has_many :schedules

  # validation
  validates :date, presence: true
  validates :complete_rate, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }

  # scope
  scope :today, -> { where(date: Date.today).first }

  # rogic
  def self.find_or_create_today_summary
    today_summary = find_today_summary

    if today_summary.blank?
      create_today_summary
    else
      today_summary
    end
  end

  def self.find_today_summary
    today
  end

  def self.create_today_summary
    create_transaction = nil
    transaction do
      create_transaction = create!(date: Date.today)
      create_transaction.generate_schedules
    end
    create_transaction
  end

  def generate_schedules
    setting = Setting.first_or_create!(time_interval: 60, start_time: "10:00", end_time: "18:00")
    interval = setting.time_interval.minutes

    (setting.start_time.to_i...setting.end_time.to_i).step(interval).each do |time|
      schedules.create!(time: Time.at(time).utc.strftime("%H:%M"), goal: nil, weather: nil)
    end
  end
end
