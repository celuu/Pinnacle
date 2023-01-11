Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api, defaults: { format: :json} do 
    resources :users, only: [:create]
    resources :groups, only: [:index, :show, :create, :update, :destroy]
    resources :reservations, only:[:index, :show, :create, :destroy] 
    resources :reviews, only:[:index, :show, :create, :update, :destroy]
    resources :clubs, only: [:index, :show]
    resource :session, only: [:create, :show, :destroy]
  end 

  get '*path', to: 'static_pages#frontend'
end
