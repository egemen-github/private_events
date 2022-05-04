Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }

  root 'events#index'

  resources :events do
    collection do
      get :your
    end
  end
end
