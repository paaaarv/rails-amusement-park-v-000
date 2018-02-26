Rails.application.routes.draw do

root 'users#home'

resources :users, only: [:create,:show]

get '/signup' => 'users#signup'

end
