Rails.application.routes.draw do

  namespace :admin, format: 'json' do
    resources :content_videos do
      resources :tags
      resources :content_video_likes, only: [:create, :destroy]
      resources :content_video_loves, only: [:create, :destroy]
      resources :content_video_comments, only: [:create, :edit, :update, :destroy]
    end
  end

  namespace :api, format: 'json' do
    namespace :v1 do
      namespace :user do
        resources :user_videos, only: [:create, :destroy]
        resources :completed_video_likes, only: [:create, :destroy]
        resources :completed_video_loves, only: [:create, :destroy]
        resources :completed_video_comments, only: [:create, :edit, :update, :destroy]
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

#only: [:index, :show, :new, :edit, :create, :update, :destroy]
