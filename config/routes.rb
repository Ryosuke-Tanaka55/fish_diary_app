Rails.application.routes.draw do
  get 'rigs/new'
  root 'static_pages#top'
  get '/signup', to: 'users#new'

  # ログイン機能
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users do
    member do
      # リグ
      resources :rigs
    end
  end
 
end
