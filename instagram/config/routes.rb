Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :posts, only: [:new, :create, :show, :destroy]

  resources :comments, only: [:create, :destroy]

  resources :posts do
    resources :likes, only: [:create, :destroy]
  end
  
  resources :users do
    resources :follows, only: [:create, :destroy]
  end

  delete 'posts/:id', to: 'posts#destroy', as: 'destroy_post'

  get 'show/:user_name', to: 'posts#show', as: 'profile'

  get 'show/:user_name/followings', to: 'follows#show', as: 'user_followings'

  # homepage for signed in users
  get 'homepage', to: 'public#homepage'

  # Defines the root path route ("/")
  devise_scope :user do
    root 'users/sessions#new'
  end
end
