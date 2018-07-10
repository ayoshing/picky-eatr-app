Rails.application.routes.draw do
  resources :restaurants
  resources :favorites
  resources :comparisons
  resources :cuisines
  resources :preferences
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
