Rails.application.routes.draw do
  devise_for :users, skip: [:sessions] 

  as :user do
    post '/users/sign_in' => 'devise/sessions#create', as: :user_session
    delete '/users/sign_out' => 'devise/sessions#destroy', as: :destroy_user_session
    get '/users/sign_out' => 'devise/sessions#destroy', as: :get_destroy_user_session
  end

  resources :projects, only: [:index, :new, :create, :show, :destroy, :update] do
    resources :sections, only: [:new, :create, :destroy, :update] do
      resources :todos, only: [:new, :create, :update, :destroy]
      resources :snippets, only: [:new, :create, :destroy]
    end
  end

  resources :goals, only: [:index, :new, :create, :destroy, :update] do
    member do
      post :complete
    end
  end

  get '/media' => 'media#index', as: :media

  resources :links, only: [:new, :create, :destroy]

  authenticated :user do
    root to: 'welcome#main', as: :main
    get '/export' => 'shipping#export', as: :export
  end

  unauthenticated do
    root to: 'welcome#index'
  end
end
