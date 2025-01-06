Rails.application.routes.draw do
  resources :date_summaries, only: [:index, :create, :update, :destroy] do
    collection do
      get :today
    end

    resources :schedules, only: [:index, :create]
  end
  resources :schedules, only: [:update, :destory]
  resources :settings, only: [:index, :update]
end
