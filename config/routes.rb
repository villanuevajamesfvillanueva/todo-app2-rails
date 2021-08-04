# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tasks
  resources :categories
  devise_for :users

  devise_scope :user do
    authenticated :user do
        root 'home#index', as: :authenticated_root
    end

    unauthenticated do
        root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  root to: 'home#index'

  patch 'tasks/update_status/:id', to: 'tasks#update_status', as: 'update_status'
end
