Rails.application.routes.draw do
  resources :date_summaries, only: [:index, :create, :update, :destroy] do
    resources :schedules, only: [:index, :create]
  end
  resources :schedules, only: [:update, :destory]
  resources :setting, only: [:show, :update]
end
