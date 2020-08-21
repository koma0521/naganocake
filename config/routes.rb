Rails.application.routes.draw do
  devise_for :end_users, controllers: {
    sessions:  'public/sessions',
    passwords:  'public/passwords',
    registrations:  'public/registrations'
  }
  devise_for :admin, controllers: {
    sessions:  'admin/sessions',
    passwords:  'admin/passwords',
    registrations:  'admin/registrations'
  }

  get 'end_users_mypage' => "public/end_users#show",as: :mypage
  root "public/items#top"
  
  scope module: :public do
    resources :addresses,except: [:show,:new]
    resources :items,only: [:index,:show]
    delete "cart_items/destroy_all" => "cart_items#destroy_all",as: :destroy_all
    resources :cart_items,except: [:show,:new,:edit]
    get 'end_users/unsubscribe' =>  "end_users#unsubscribe",as: :unsubscribe
    patch 'end_users/withdraw' => "end_users#withdraw",as: :withdraw
    resources :end_users,only: [:show,:edit,:update]
    post "confirm" => "orders#confirm",as: :confirm
    get "complete" => "orders#complete",as: :complete
    resources :orders,only: [:new,:index,:show,:create]
  end

  namespace :admin do
    root 'top#top'
    resources :items,except: [:destroy]
    resources :genres,only: [:index,:create,:edit,:update]
    resources :end_users,except: [:destroy,:new,:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
