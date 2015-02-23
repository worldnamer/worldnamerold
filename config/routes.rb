Rails.application.routes.draw do
  devise_for :users, skip: [:sessions] 

  as :user do
    post '/users/sign_in' => 'devise/sessions#create', as: :user_session
    delete '/users/sign_out' => 'devise/sessions#destroy', as: :destroy_user_session
    get '/users/sign_out' => 'devise/sessions#destroy', as: :get_destroy_user_session
  end

  resources :projects, only: [:index, :new, :create, :show]

  authenticated :user do
    root to: 'welcome#main', as: :main
  end

  unauthenticated do
    root to: 'welcome#index'
  end
end