Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }

  root 'events#index'
  resources :involvements, only: [:create, :destroy]
  resources :events do
    collection do
      get :your
    end
  end

  # resources :involvements
end
