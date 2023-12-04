Rails.application.routes.draw do
  devise_for :users

  # rootパスの設定
  root 'items#index'

  # ユーザー登録、ログイン、ログアウトのルート設定
  get 'signup', to: 'users#new', as: 'signup'
  post 'users', to: 'users#create'
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  # Itemsコントローラの標準的なルーティングを一括で追加
  # indexアクションを含めるために、onlyオプションからindexを削除
  resources :items do
    resources :orders, only: [:new, :create] # この行を追加
  end
  # その他のルート...
end
