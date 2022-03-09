Rails.application.routes.draw do
  resources :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root "home#index"
  get "commercial", to: "home#commercial" 
  get "residential", to: "home#residential" 
  get "quote", to: "home#quote"
end