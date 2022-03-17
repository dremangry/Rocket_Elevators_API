Rails.application.routes.draw do
  devise_for :users
  get "quotes", to: "quotes#new"
  post "quotes", to: "quotes#create"

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"
  get "commercial",  to: "home#commercial"
  get "residential", to: "home#residential"
  
end
