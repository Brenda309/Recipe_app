Rails.application.routes.draw do
 devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
   root to: "users#index"
 resources :users
  resources :foods
  resources :recipes do
    resources :recipefoods
  # Defines the root path route ("/")
  end
end
