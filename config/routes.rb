Rails.application.routes.draw do
  devise_for :users

  resources :projects do
    resources :tasks, shallow: true, controller: 'projects/tasks'
    resources :invitation, shallow: true, controller: 'projects/invitation', only: [:create]
  end

  root 'home#index'
end
