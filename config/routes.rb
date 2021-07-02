Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  get 'home/about' => 'homes#about'
  resources :books
  resources :users,only: [:show,:index,:edit,:update] do
   resources :post_comments, only: [:create, :destroy]
  end
  
end