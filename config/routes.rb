Rails.application.routes.draw do
  root to: "home#index"
  resources :home, only: :index

  devise_for :users
  
  get '/posts/new/(:subreddit_id)', to: 'posts#new', as: :new_post
  
  resources :posts, except: :new do
    resources :comments, only: [:index, :create]
    get '/comments/new/(:parent_id)', to: 'comments#new', as: :new_comment
  end

  resources :subreddits


end


