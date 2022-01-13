Rails.application.routes.draw do
  root "stages#index"
  resources :stages do
    get "search", on: :collection
  end

  resource :usersessions
  resources :users do
    resources :reservations
  end
  resource :actorsessions

  resources :actors do
    get "actor_request_stages", on: :collection
    get "actor_past_stages", on: :collection
  end
  resource :adminsessions
  resource :admin
  resource :password

end
