# frozen_string_literal: true

Rails.application.routes.draw do
  get 'welcome/index'
  get 'hello_world', to: 'hello_world#index'

  devise_for :users do
    delete '/users/sign_out' => 'devise/sessions#destroy'
  end
  devise_for controllers: { sessions: 'users/sessions' }

  authenticated :user, ->(u) { u.admin? } do
    namespace :admin do
      resources :announcements
      resources :users
      require 'sidekiq/web'
      mount Sidekiq::Web => '/sidekiq'

      root to: 'users#index'
    end
  end

  authenticated :user do
    resources :announcements, only: %i[index show]

    if Rails.env.development?
      mount LetterOpenerWeb::Engine, at: '/letter_opener'
    end

    get 'home/index'

    root to: 'home#index', as: :user_root
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'welcome#index'
end
