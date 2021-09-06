# frozen_string_literal: true

Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
    resources :posts
  end

  namespace :admin do
    resources :users
  end

  resources :posts do
    get 'name_of_post', on: :member
    get 'last_post', on: :collection
  end

  get 'greetings/hello'
end
