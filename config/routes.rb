Rails.application.routes.draw do
  resources :vehicle_inspections
  resources :vehicle_reports
  root 'dashboard#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
