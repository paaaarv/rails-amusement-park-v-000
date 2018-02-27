Rails.application.routes.draw do

root 'users#home'

resources :users, only: [:new, :create,:show]


get '/signin' => 'users#signin'

end
