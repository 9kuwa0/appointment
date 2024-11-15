Rails.application.routes.draw do
  devise_for :staff_members, controllers: { registrations: 'staff_members/registrations' }

  get 'staff_member/dashboard', to: 'staff_members#dashboard', as: :staff_member_dashboard
  # get 'user/dashboard', to: 'users#dashboard', as: :user_dashboard 後で使う

  root to: 'home#index'

  resources :staff_members, only: [:destroy]


end
