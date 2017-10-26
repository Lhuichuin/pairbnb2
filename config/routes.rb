Rails.application.routes.draw do

  root 'static#home'
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

resources :users, controller: "users", only: [:edit, :update, :show]
resources :listings, controller: "listings"
  # get "/users/:id(.:format)", edit_user_path 
  # post "/users/:id(.:format)", user_path
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/listings/:id/verification', to:'listings#verify', as: 'verification'
end

