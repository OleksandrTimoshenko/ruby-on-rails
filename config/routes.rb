Rails.application.routes.draw do
  resources :posts
  resources :users
  root "articles#index"

  resources :articles do
    resources :comments
  end
end

