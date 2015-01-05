Blocitoff2::Application.routes.draw do
  devise_for :users
  resources :lists

  get 'about' => 'welcome#about'
  root to: 'welcome#index'
end
