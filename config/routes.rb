Rails.application.routes.draw do

  devise_for :users
  
  resources :home, only: :index
  resources :posts do
    resources :comments, only: [:index, :create]
    get '/comments/new/(:parent_id)', to: 'comments#new', as: :new_comment
  end


  root to: "home#index"
end


