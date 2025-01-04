class SchedulesController < ApplicationController
  def index
    schedules = DateSummary.find(params[:date_summary_id]).schedules
    render json: schedules
  end

  def create #多分使わん
    summary = DateSummary.find(params[:date_summary_id])
    schedule = summary.schedules.new(schedule_params)

    if schedule.save
      render json: schedule, status: :create
    else
      render json: { errors: schedule.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    schedule = Schedule.find(params[:id])
    if schedule.update(schedule_params)
      render json: schedule
    else
      render json: { errors: schedule.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    schedule = Schedule.find(params[:id])
    schedule.destroy
    head :no_content
  end

  private

  def schedule_params
    params.require(:schedule).permit(:time, :goal, :weather)
  end
end
