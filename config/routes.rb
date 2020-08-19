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
  end

  namespace :admin do
    root 'top#top'
    resources :items,except: [:destroy]
    resources :genres,only: [:index,:create,:edit,:update]
    resources :end_users,except: [:destroy,:new,:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
