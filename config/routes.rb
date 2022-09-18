Rails.application.routes.draw do
  
  resources :users
  root  'user_videos#index'
  resources :user_videos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
