Rails.application.routes.draw do
  root 'boards#index'
  resources :boards, only: %i[new create show edit update]
end
