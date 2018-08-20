Rails.application.routes.draw do
  resources :sessions
  resources :restaurants
  resources :favorites
  resources :cuisines
  resources :preferences
  resources :users
  resources :cuisines_preferences
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
