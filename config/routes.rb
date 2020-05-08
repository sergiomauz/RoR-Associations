Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :events, only: [:index, :new, :create, :show]


  get '/users/attend/:id', to: 'users#attend', as: 'attend'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "events#index"
end
