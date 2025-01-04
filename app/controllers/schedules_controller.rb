class SchedulesController < ApplicationController
  def index
    data = [
      { id: 1, time: "08:00", message: "朝のミーティング" },
      { id: 2, time: "12:00", message: "ランチ" },
      { id: 3, time: "15:00", message: "進捗確認" }
    ]
    render json: data
  end
end
