Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "sheets", to: "sheets#index"
  get '/movies/:movie_id/reservation', to: 'movies#reservation', as: 'movie_reservation'
  post '/reservations', to: 'reservations#create'

  resources :movies do
    resources :schedules do
      resources :reservations, only: [:new, :create]
    
    end
  end
# config/routes.rb
namespace :admin do
  resources :movies do
    resources :schedules, only: [:new, :create]
  end
  resources :schedules, except: [:new, :create]
end

end
