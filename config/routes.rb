Rails.application.routes.draw do
  resources :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root "home#index"
  get "home/commercial" 
  get "home/residential" 
  get "home/quote"
end
