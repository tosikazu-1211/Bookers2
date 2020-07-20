Rails.application.routes.draw do
	devise_for :users
  root :to => 'homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'homes/about' => 'homes#about', as: 'homes'
  resources :users, only: [:edit, :update, :index, :show]
  resources :books, only: [:edit, :update, :index, :show, :destroy, :create]

end
