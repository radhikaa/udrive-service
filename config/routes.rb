Rails.application.routes.draw do
  resources :cars
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'locations#index'

  resources :users

  get 'cars/nearby/available' => 'cars#nearby_and_available'
  resources :cars, only: [:create] do
    member do
      put :book
    end
    collection do
      post '/:device_id/update_location', to: 'cars#update_location'
    end
  end

  resources :car_bookings do
    collection do
      post '/:device_id/close_trip', to: 'car_bookings#close_trip'
    end
  end
end