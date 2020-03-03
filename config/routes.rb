Rails.application.routes.draw do

  devise_for :users do
  	get '/users/sign_out' => 'devise/sessions#destroy', :as => :destroy_user_session_path
  end

  resources :home, only: [:index]
  resources :books, only: [:index, :show ,:edit, :update, :create, :destroy]
  resources :users, only: [:index, :show, :edit, :update]

  get 'home/about'
  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
