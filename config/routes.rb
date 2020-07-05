Rails.application.routes.draw do

devise_for :users

root :to => 'top#top'

resources :users, only: [:show, :edit, :update, :index]
resources :project, only: [:new, :create, :show, :edit, :update, :index, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
