Rails.application.routes.draw do
  get 'friends/index'

  delete 'friends/destroy'

  resources :friend_requests, except: [:show, :edit, :new]
  devise_for :users
	root 'static_pages#home'
	resources :users, only: [:show, :index] do
		resources :posts
	end
end
