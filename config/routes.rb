# frozen_string_literal: true

Rails.application.routes.draw do
  # get 'posts/index'
  devise_for :users, controllers: { registrations: "registrations" }

  resources :posts

  resources :users

  resources :comments

  resources :categories

  resources :posts_categories

  resources :rankings

  root "home#index"

  get "post_home/:id", to: "home#show"

  post "/post_home/:id/comments", to: "comments#create", as: "post_comments"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
