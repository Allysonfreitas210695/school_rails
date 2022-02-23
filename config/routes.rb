Rails.application.routes.draw do
  resources :teachers
  resources :students, only: [:index, :edit, :update, :new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'
end
