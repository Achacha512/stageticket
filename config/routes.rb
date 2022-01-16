Rails.application.routes.draw do
  root "stages#index"
  resources :stages do
    post "confirm", on: :collection
    get "search", on: :collection
    member do
      get :admin_stage_show
      get :actor_stage_show
    end
    resources :reservations
  end

  resource :usersessions
  resources :users do
    resources :reservations
  end
  resource :actorsessions

  resources :actors do
    get "actor_request_stages", on: :collection
    get "actor_past_stages", on: :collection
    resources :stages do
      get "admin_past_stages", on: :collection
    end

  end
  resource :adminsessions
  resource :admin do
    get "admin_request_stages", on: :collection
  end
  resource :password

end
