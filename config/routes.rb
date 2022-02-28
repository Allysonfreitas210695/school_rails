Rails.application.routes.draw do
  resources :teachers, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :students, only: [:index, :edit, :update, :new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'
end
