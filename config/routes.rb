Rails.application.routes.draw do

root 'users#home'

resources :users, only: [:create]

get '/signup' => 'users#signup'

end
