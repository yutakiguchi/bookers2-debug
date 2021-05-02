Rails.application.routes.draw do
  devise_for :users
 
  root to:'homes#top'
  get 'home/about' => 'homes#about'
  resources :books do
  resources :book_coments, only:[:create,:destroy]
  resource :favorites,only:[:create,:destroy]
end
 resources :users,only: [:show,:index,:edit,:update]
end