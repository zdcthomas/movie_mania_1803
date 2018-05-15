Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :movies, only: [:index]

  resources :directors, shallow: true do
    resources :movies
  end

  resources :actors, only: [:new, :create, :index]
end
