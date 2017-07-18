Rails.application.routes.draw do
  ## we call the resources method and pass it a Symbol
  resources :topics do
    resources :posts, except: [:index]
  end

  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down-vote' => 'votes#down_vote', as: :down_vote
  end
  ## we create routes for new and create actions
  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create, :destroy]

  ## we remove get "welcome/index" because we've declared the index view as the root view
  get 'about' => 'welcome#about'

  root 'welcome#index'

end
