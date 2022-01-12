Rails.application.routes.draw do
  root "stages#index"
  resources :stages do
    get "search" ,on: :collection
  end

  resource :usersessions
  resources :users do
    resources :reservations
  end
  resource :actorsessions
  resources :actors
  resource :adminsessions
  resource :admin
  resource :password

end
