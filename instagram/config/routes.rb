Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  
  get '/homepage' => 'public#homepage'

  # Defines the root path route ("/")
  devise_scope :user do
    root 'users/sessions#new'
  end
end
