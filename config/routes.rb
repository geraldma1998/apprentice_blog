# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

  resources :posts, except: [:index] do
    resources :comments, only: [:create]
  end

  resources :users

  resources :comments, only: %i[create update destroy]

  resources :rankings, only: %i[index create]

  root "posts#index"
end
