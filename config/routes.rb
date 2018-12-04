Rails.application.routes.draw do
  resources :buses
  resources :sptrans
  get 'bus_stops/search_for_bus_stop', to: 'bus_stops_controller#search_for_bus_stop'
  post 'bus_stops/search_for_bus_stop', to: 'bus_stops#search_for_bus_stop'
  get 'bus_stops/show//:id/cl/:cl' => "id#cl", :as => :id
  post 'bus_stops/show'
  get 'bus_stops/index'
  root 'bus_stops#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
