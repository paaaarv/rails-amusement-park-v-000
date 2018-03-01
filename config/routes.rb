Rails.application.routes.draw do

root 'users#home'

resources :users, only: [:new, :create,:show]
resources :attractions, only: [:index, :new, :edit, :create, :show]

get '/signin' => 'users#signin'
post '/signin' => 'users#create'
get '/logout' => 'users#destroy'
patch "/users/:id" => 'users#update'
patch "/attractions/:id" => 'attractions#update'

end
