Rails.application.routes.draw do
  get '/schedules', to: 'schedules#index'
end
