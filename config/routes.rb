Rails.application.routes.draw do
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "users/registrations",
    sessions: 'users/sessions'
  }

  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admins/sessions"
  }

  resources :posts do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end

  # マイページと投稿編集ページ
   resources :users, only: [:show, :edit, :update]

  root to: 'homes#top'
  namespace :admin do
   resources :users, only: [:index, :destroy]
   resources :posts, only: [:index, :destroy]
  end
end
