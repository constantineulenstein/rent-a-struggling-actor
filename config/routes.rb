Rails.application.routes.draw do
  root to: 'pages#home'
  get '/users/show/:id', to: 'users#show', as: 'user_show'
  get '/users/:id/requests', to: 'users#requests', as: 'user_requests'
  get '/users/:id/requests/approve', to: 'transactions#approve', as: 'user_request_approve'
  get '/users/:id/requests/reject', to: 'transactions#reject', as: 'user_request_reject'
  # get '/users/show/:id/edit', to: 'users#edit', as: 'edit_user'
  # patch '/users/show/:id', to: 'users#update', as: 'user'
  resources :users, only: :index do
      resources :trademarks, only: [:new, :create, :edit, :update, :destroy]
      resources :transactions, only: [:new, :create, :edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
  devise_for :users
end
