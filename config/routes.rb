Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      post '/sessions', to: 'sessions#create'
      get '/sessions/current_user', to: 'sessions#show'
      post '/users/get_clients', to: 'users#get_clients'
    end
  end
end
