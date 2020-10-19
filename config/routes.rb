Rails.application.routes.draw do
  get 'contacts/new'
  root 'static_pages#top'
  get '/signup', to: 'users#new'

  # ログイン機能
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users do
    member do
      get 'tackle'
    end
      # リグ・タックル・お問い合わせ
      resources :rigs, :except => :show
      resources :rods, :except => :show
      resources :reels, :except => :show
      resources :lines, :except => :show
      resources :leaders, :except => :show
      resources :lures, :except => :show
      resources :colors, :except => :show
      resources :baits, :except => :show
      resources :hooks, :except => :show
      resources :inquiries, only: [:index, :new, :create]
  end
end