Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :users
  # トップページの表示
  root to: 'items#index'


  resources :items do
  end
  
  # 新規登録ページの表示
  # devise_for :users, controllers: {
  #     registrations: 'users/registrations', 
  #     sessions: "users/sessions"
  #   } 
    

  # devise_scope :user do
  #   get '/users/sign_out', to: 'devise/sessions#destroy'
    
  #   # get '/users/new', to: "users/registrations#new"
  # end
  
  


end
