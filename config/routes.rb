Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'
  get '/login', to: 'users#login'
  get '/logout', to: 'users#logout'
  post '/signin', to: 'users#signin'
  get '/suggestions', to: 'articles#suggestions'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
