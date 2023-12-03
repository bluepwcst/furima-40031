Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'items#index'
  # ユーザーの新規登録用のルート
  get 'signup', to: 'users#new', as: 'signup'
  post 'users', to: 'users#create'

  # ログイン用のルート
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'

  # ログアウト用のルート
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  # その他のルート...
  # 商品出品のルート
  resources :items, only: [:new, :create]

end
