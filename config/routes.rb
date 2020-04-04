Rails.application.routes.draw do
  devise_for :users

  resources :projects do
    resources :tasks, shallow: true, controller: 'projects/tasks'
  end

  root 'home#index'
end
