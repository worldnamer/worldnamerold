Rails.application.routes.draw do
  devise_for :users, skip: [:sessions] 

  as :user do
    post '/users/sign_in' => 'devise/sessions#create', as: :user_session
    delete '/users/sign_out' => 'devise/sessions#destroy', as: :destroy_user_session
  end

  authenticated :user do
    root to: 'welcome#index', as: :authenticated_root
  end

  unauthenticated do
    root to: 'welcome#index'
  end
end
