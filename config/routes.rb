Blocitoff2::Application.routes.draw do
  get "items/create"
  devise_for :users
  resources :lists
    resources :items, only: [:create]

  get 'about' => 'welcome#about'
  root to: 'welcome#index'
end
