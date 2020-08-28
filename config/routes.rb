Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # トップページの表示
  
  # 新規登録ページの表示
  devise_for :users, controllers: {
      registrations: 'users/registrations', 
      sessions: "users/sessions"
    } 
    
    root to: 'items#index'

  # devise_scope :user do
  #   root "users/registrations#new"
  # end


end
