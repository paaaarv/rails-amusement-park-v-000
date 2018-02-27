Rails.application.routes.draw do

root 'users#home'

resources :users, only: [:new, :create,:show]

get '/signin' => 'users#signin'
post '/signin' => 'users#create'
get '/logout' => 'users#destroy'

end
