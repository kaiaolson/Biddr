Rails.application.routes.draw do
  resources :users, only: [:new, :create, :edit, :update, :show] do
    get "/change_password" => "users#change_password"
  end
  resources :sessions, only: [:new, :create, :destroy] do
    delete :destroy, on: :collection
    get :forgot_password, on: :collection
  end

  resources :auctions do
    resources :bids, only: [:create]
    resources :publishings, only: [:create]
  end

  resources :bids, only: [:index]

  root "auctions#index"
end
