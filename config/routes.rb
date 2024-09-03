Rails.application.routes.draw do
  namespace :admin do
    resources :users, only: [:index, :new, :create, :edit, :update]
  end

  namespace :client do 
    resources :memberships, only: [:index]
  end

  get 'pages/index'
  root to: "pages#index"

  # inicio y cierre de sesión
  get '/users/sign_in', to: 'sessions#new'
  post '/users/sign_in', to: 'sessions#create'
  delete '/users/sign_out', to: 'sessions#destroy'
end
