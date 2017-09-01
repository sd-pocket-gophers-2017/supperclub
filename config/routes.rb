Rails.application.routes.draw do
  devise_for :admin
  post 'events/:event_id/guests/:id', to: 'invites#create', as: 'add_event_guest'

  resources :events do
    resources :invites, only: [:new, :create, :index, :destroy]
    resources :guests, only: [:index, :create, :new]
  end

  root 'events#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resource :messages, only: [] do
    collection do
      post 'send_messages'
      post 'reply'
    end
  end

  get '/visitor/:id', to: 'events#present'
end
