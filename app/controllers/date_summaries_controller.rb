class DateSummariesController < ApplicationController
  def index
    summaries = DateSummary.all
    render json: summaries
  end

  def create
    summary = DateSummary.new(summary_params)
    if summary.save
      render json: summary, status: create
    else
      render json: { errors: summary.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    summary = DateSummary.find(params[:id])
    if summary.update(summary_params)
      render json: summary
    else 
      render json: { errors: summary.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destory
    summary = DateSummary.find(params[:id])
    summary.destroy
    head :no_content
  end

  def today
    summary = DateSummary.find_or_create_today_summary
    render json: summary, include: :schedules
  end

  private

  def summary_params
    params.require(:date_summary).permit(:date, :complete_rate, :memo)
  end
end
