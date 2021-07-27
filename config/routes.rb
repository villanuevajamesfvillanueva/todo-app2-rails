# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tasks
  devise_for :users
  root to: 'home#index'
end
