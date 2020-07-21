Rails.application.routes.draw do

devise_for :users

root :to => 'tops#top'

resources :users, only: [:show, :edit, :update, :index]
resources :projects, only: [:new, :create, :show, :edit, :update, :index, :destroy] do
	resource :favorites, only:[:create, :destroy]
end
resources :project_data, only: [:new, :create, :edit, :update, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
