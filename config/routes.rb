Rails.application.routes.draw do
  
  get 'chats/show'
  root to: 'homes#top'
  devise_for :users
  get 'home/about' => 'homes#about'
  get 'search/search' => 'search#search'
  resources :users,only: [:show,:index,:edit,:update] do
   resource :relationships, only: [:create, :destroy]
   get 'followings' => 'relationships#followings', as: 'followings'
   get 'followers' => 'relationships#followers', as: 'followers'
  end
  get 'chat/:id' => 'chats#show', as: 'chat'
  resources :chats, only: [:create]
  resources :books do
   resource :favorites, only: [:create, :destroy]
   resources :book_comments, only: [:create, :destroy]
  end
  
end