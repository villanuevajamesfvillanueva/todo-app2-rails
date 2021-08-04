# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tasks
  resources :categories
  devise_for :users
  root to: 'home#index'

  patch 'tasks/update_status/:id', to: 'tasks#update_status', as: 'update_status'
end
