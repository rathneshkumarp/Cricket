Rails.application.routes.draw do
  # get 'users/create'
  # get 'users/login'
  # get 'create/login'
  # get 'sessions/create'
  # get 'teams/index'
  # get 'teams/show'
  # get 'teams/create'
  # get 'teams/update'
  # get 'teams/destory'
  # get 'tournaaments/index'
  # get 'tournaaments/show'
  # get 'tournaaments/create'
  # get 'tournaaments/update'
  # get 'tournaaments/destory'
  # get 'players/index'
  # get 'players/show'
  # get 'players/create'
  # get 'players/update'
  # get 'players/destory'
  # get 'teamperformances/index'
  # get 'teamperformances/show'
  # get 'teamperformances/create'
  # get 'teamperformances/update'
  # get 'teamperformances/destory'
  # get 'playerperformances/index'
  # get 'playerperformances/show'
  # get 'playerperformances/create'
  # get 'playerperformances/update'
  # get 'playerperformances/destory'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :teams, only: [:index, :show, :create, :update, :destroy]
   
  # get "join"=> "teams#join"
  


  resources :tournaaments, only: [:index, :show, :create, :update, :destroy]
 
  get "max_order" => "tournaaments#max_order"
  # get "paginate"=> "tournaaments#paginate"


  resources :players, only: [:index, :show, :create, :update, :destroy]

  get "search" => "players#search"
  

  resources :teamperformances, only: [:index, :show, :create, :update, :destroy]
  resources :playerperformances, only: [:index, :show, :create, :update, :destroy]

  # post "create" => "sessions#create"
  
  # Defines the root path route ("/")
  # root "articles#index"

  resources :users
  post "users/forget_password" => "users#forget_password"
  post "users/reset_password" => "users#reset_password"
  post "users/login" => "users#login"
  post "create" => "users#create"
  post "users/logout" => "users#logout"


end
