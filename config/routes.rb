Rails.application.routes.draw do

devise_for :users

root :to => 'tops#top'

resources :users, only: [:show, :edit, :update, :index]
resources :projects, only: [:new, :create, :show, :edit, :update, :index, :destroy] do
	resource :favorites, only:[:create, :destroy]
end
resources :project_data, only: [:new, :create, :edit, :update, :destroy]

post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す
get 'user/:id/follows' => 'relationships#follows', as: 'follows'
get 'user/:id/followers' => 'relationships#followers', as: 'followers'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
