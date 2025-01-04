class SettingsController < ApplicationController
  def show
    setting = Setting.first_or_create!(time_interval: 60, start_time: "08:00", end_time: "20:00")
    render json: setting
  end

  def update
    setting = Setting.first
    if setting.update(setting_params)
      render json: setting
    else
      render json: { errors: setting.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def setting_params
    params.require(:setting).permit(:time_interval, :start_time, :end_time)
  end
end
