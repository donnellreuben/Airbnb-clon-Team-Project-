Rails.application.routes.draw do
get "/rooms" => "rooms#index"
post "/rooms" => "rooms#new"
get "/rooms/:id" => "rooms#show"
post "/rooms" => "room#create"
patch "/rooms/:id" => "rooms#update"
delete "/rooms/:id" => "rooms#destroy"

get "/reservations" => "reservations#index"
post "/reservations" => "reservations#new"
get "/reservations/:id" => "reservations#show"
post "/reservations" => "reservations#create"
patch "/reservations/:id" => "reservations#update"
delete "/reservations/:id" => "reservations#destroy"

get "/reviews" => "reviews#index"
post "/reviews" => "reviews#new"
get "/reviews/:id" => "reviews#show"
post "/reviews" => "reviews#create"
patch "/reviews/:id" => "reviews#update"
delete "/reviews/:id" => "reviews#destroy"

get "/room_images" => "room_images#index"
post "/room_images" => "room_images#new"
get "/room_images/:id" => "room_images#show"
post "/room_images" => "room_images#create"
patch "/room_images/:id" => "room_images#update"
delete "/room_images/:id" => "room_images#destroy"

get "/users" => "users#index"
post "/users" => "users#new"
get "/users/:id" => "users#show"
post "/users" => "users#create"
patch "/users/:id" => "users#update"
delete "/users/:id" => "users#destroy"

end
