Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  get 'users/me'
  get 'sessions/create'
  get 'sessions/destroy'
  root 'boards#index'
  resources :boards, except: %i[index]
  resources :comments, only: %i[create destroy]
end
