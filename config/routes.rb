Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'movies', to: 'movies#index'
  # config/routes.rb
  namespace :admin do
    resources :movies, only: [:index]

  end

end
