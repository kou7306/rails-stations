Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'movies', to: 'movies#index'
  get 'movies/:id', to: 'movies#show'
  get "sheets", to: "sheets#index"


# config/routes.rb
namespace :admin do
  resources :movies do
    resources :schedules, only: [:new, :create]
  end
  resources :schedules, except: [:new, :create]
end

end
