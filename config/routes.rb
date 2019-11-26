Rails.application.routes.draw do
  root to: 'pages#home'
  resources :users, only: [:index, :show, :edit, :update] do
    resources :transactions, only: [:new, :create, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
  devise_for :users
end
