Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :restaurants do
    # get 'index', to: 'restaurants#index'
    resources :reviews, only: [ :new, :create ]
  end
end
