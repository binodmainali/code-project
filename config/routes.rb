Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root "events#index"
  resources :events,  only: [:index, :show] do
    member do
      post :subscribe_unsubscribe
    end
  end
end
