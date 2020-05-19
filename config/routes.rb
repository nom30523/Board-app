Rails.application.routes.draw do
  get 'mypage', to: 'users#me'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  root 'boards#index'
  resources :users, only: %i[new create]
  resources :boards, except: %i[index]
  resources :comments, only: %i[create destroy]
end
