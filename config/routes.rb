Rails.application.routes.draw do
  resources :advertisements

  ## we call the resources method and pass it a Symbol
  resources :posts

  ## we remove get "welcome/index" because we've declared the index view as the root view
  get 'about' => 'welcome#about'

  root 'welcome#index'

end
