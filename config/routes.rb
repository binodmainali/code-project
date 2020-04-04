Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root "events#index"
  resources :events,  only: [:index, :show] do
    member do
      post :add_participant
      post :remove_participant
    end
  end
end
