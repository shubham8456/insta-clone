Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # homepage for signed in users
  get 'homepage' => 'public#homepage'

  resources :posts, only: [:new, :create, :show]

  get 'posts/new' => 'posts#new'

  # Defines the root path route ("/")
  devise_scope :user do
    root 'users/sessions#new'
  end
end
