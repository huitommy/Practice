Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "chatrooms#index"
  resources :chatrooms do
    resources :messages, only: [:create]
  end
end
