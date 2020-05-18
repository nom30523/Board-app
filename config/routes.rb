Rails.application.routes.draw do
  root 'boards#index'
  resources :boards, except: %i[index]
  resources :comments, only: %i[create destroy]
end
