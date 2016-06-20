Rails.application.routes.draw do
  devise_for :users
  
  root "public#landing"

  match 'tags/search' , {:via => :get, :to => 'tags#search'}
  match 'recipes/search_by_ingredients' , {:via => :get, :to => 'recipes#search_by_ingredients'}
  match 'recipes/:id', {:via => :post, :to => 'recipes#rating'}
  resources :recipes
  resources :tags
  match 'recipes/:id/add_tag', {:via => :post, :to => 'recipes#add_tag'}
end
