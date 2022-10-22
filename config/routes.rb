Rails.application.routes.draw do
  
  devise_for :users
  root to: "users#index"
  resources :users
  resources :foods
  get '/general_shopping_list', to: 'shopping#index', as: 'general_shopping_list'
  resources :recipes do
    resources :recipe_foods
  end
   resources :public_recipes
end