# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tasks
  resources :categories
  devise_for :users
  root to: 'home#index'
end
