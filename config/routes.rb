Rails.application.routes.draw do

  get 'likes/create'

  get 'likes/destroy'

  get 'friends/index'

  delete 'friends/destroy'

  # devise_scope :user do
  #   delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end

  resources :friend_requests, except: [:show, :edit, :new]
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
	root 'static_pages#home'
	resources :users, only: [:show, :index] do
		resources :posts do
      resources :comments, only: [:create, :destroy]
    end
	end
end
