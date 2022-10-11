Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :posts, only: [:new, :create, :show]
  resources :comments, only: [:create, :destroy]

  # homepage for signed in users
  get 'homepage' => 'public#homepage'

  get 'posts/new' => 'posts#new'

  get 'show/:user_name' => 'posts#show', as: 'profile'

  # Defines the root path route ("/")
  devise_scope :user do
    root 'users/sessions#new'
  end
end
