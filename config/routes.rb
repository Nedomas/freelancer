Rails.application.routes.draw do

  root 'tags#index'

  resources :buckets
  resources :posts
  resources :tags
  get 'tag/update/:id' => 'tags#update', as: :update_tag
  resources :related_posts
  get 'related_posts/move_to/:bucket/:post_id' => 'related_posts#move_to', as: :move_to
end
