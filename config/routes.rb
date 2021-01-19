Rails.application.routes.draw do

  devise_for :users
  root to: "items#index"
  resources :items do
    resources :comments, only:[:create]
    resources :orders, only:[:index, :create]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
