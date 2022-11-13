Rails.application.routes.draw do
  
  #ゲストログイン
  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end
  
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip:[:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
  }

  # 会員用
  # URL /users/sign_in ...
  devise_for :users, skip:[:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
  
  # 会員用
  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about'
    resources :users, only: [:show,:edit,:update] do
      member do
        get :favorites
      end
    end 
    resources :posts, only: [:new,:index,:show,:edit,:create,:destroy,:update] do
      resource :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
      get 'search', to: 'posts#search'
    end
  end
  
  # 管理者用
  namespace :admin do
    root to: 'homes#top'
    get '/about' => 'homes#about'
    resources :users, only: [:index, :show, :edit, :update]
    resources :posts, only: [:index, :show, :destroy]
  end 
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
