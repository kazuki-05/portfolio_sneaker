Rails.application.routes.draw do
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "users/registrations",
    sessions: 'users/sessions'
  }

  # ゲストログイン機能
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end


  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admins/sessions"
  }

  get  "favorites"  => "favorites#index"
  resources :posts do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  
  resources:items ,only: [:index, :show]

  # マイページと投稿編集ページ
  resources :users, only: [:show, :edit, :update]

  root to: 'homes#top'
  namespace :admin do
    resources :users, only: [:index, :destroy]
    resources :posts, only: [:index, :destroy]
    resources :post_comments, only: [:index, :destroy]
    resources :brands
  end
end
