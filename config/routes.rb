Rails.application.routes.draw do
  resources :buses
  resources :sptrans
  get 'bus_stop/search_for_bus_stop'
  post 'bus_stop/search_for_bus_stop'
  get 'bus_stop/index'
  root 'bus_stop#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
