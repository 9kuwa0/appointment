Rails.application.routes.draw do

  devise_for :staff_members, controllers: { registrations: 'staff_members/registrations' }

  get 'staff_member/index', to: 'staff_members#index', as: :staff_member_index
  # get 'user/dashboard', to: 'users#dashboard', as: :user_dashboard 後で使う

  root to: 'home#index'

  resources :staff_members, only: [:index]
  resources :patients, only: [:new, :create]



 
end
