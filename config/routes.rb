# frozen_string_literal: true

Rails.application.routes.draw do
  # get 'posts/index'
  devise_for :users, controllers: { registrations: "registrations" }

  resources :posts

  resources :users

  resources :comments

  resources :categories

  root "home#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
