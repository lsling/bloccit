Rails.application.routes.draw do
  resources :posts
  resources :questions

  ## we remove get "welcome/index" because we've declared the index view as the root view
  get 'about' => 'welcome#about'

  root 'welcome#index'

end
