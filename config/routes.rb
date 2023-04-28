Rails.application.routes.draw do
  # get "/rooms" => "rooms#index"
  # post "/rooms" => "rooms#new"
  # get "/rooms/:id" => "rooms#show"
  # post "/rooms" => "room#create"
  # patch "/rooms/:id" => "rooms#update"
  # delete "/rooms/:id" => "rooms#destroy"
  # get "/rooms/:id/edit" => "rooms#edit"  


  # get "/reservations" => "reservations#index"
  # post "/reservations" => "reservations#new"
  # get "/reservations/:id" => "reservations#show"
  # post "/reservations" => "reservations#create"
  # patch "/reservations/:id" => "reservations#update"
  # delete "/reservations/:id" => "reservations#destroy"

  # get "/reviews" => "reviews#index"
  get "/reviews" => "reviews#new"
  # get "/reviews/:id" => "reviews#show"
  post "/reviews" => "reviews#create"
  # patch "/reviews/:id" => "reviews#update"
  # delete "/reviews/:id" => "reviews#destroy"

  # get "/room_images" => "room_images#index"
  # post "/room_images" => "room_images#new"
  # get "/room_images/:id" => "room_images#show"
  # post "/room_images" => "room_images#create"
  # patch "/room_images/:id" => "room_images#update"
  # delete "/room_images/:id" => "room_images#destroy"


  resources :rooms do
    get 'reservations', on: :member
    post 'create_reservation', on: :member
  end
# SIGNUP
  get "/signup" => "users#new"
  post "/users" => "users#create"

# LOGIN
  get "/login" => "sessions#new"
  post "/sessions" => "sessions#create"
  get "/logout" => "sessions#destroy"  

  
end
