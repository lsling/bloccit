Rails.application.routes.draw do
  ## we call the resources method and pass it a Symbol
  resources :topics do
    resources :posts, except: [:index]
  end

  ## we remove get "welcome/index" because we've declared the index view as the root view
  get 'about' => 'welcome#about'

  root 'welcome#index'

end
