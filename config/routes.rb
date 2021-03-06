Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :users

  # トップページの表示
  root to: 'items#index'
  resources :items do
    resources :orders, only:[:create, :index]
  end

end
