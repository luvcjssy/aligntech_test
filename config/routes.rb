Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins

  root to: 'dashboard#index'

  resources :orders, only: %w[index show edit update]
  resources :dashboard, only: %w[index]
  resources :products, only: %w[index]
end
