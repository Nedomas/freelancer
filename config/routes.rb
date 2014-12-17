Rails.application.routes.draw do

  root 'tags#index'

  resources :buckets
  resources :posts
  resources :tags
  get 'tag/update/:id' => 'tags#update', as: :update_tag
  resources :related_posts
  get 'related_posts/reject/:id' => 'related_posts#reject', as: :reject_related_post
  get 'related_posts/move_to_bidded/:id' => 'related_posts#move_to_bidded', as: :move_to_bidded
end
