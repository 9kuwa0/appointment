Rails.application.routes.draw do
  devise_for :families,      controllers: { registrations: 'families/registrations', sessions: 'families/sessions'}
  devise_for :staff_members, controllers: { registrations: 'staff_members/registrations', sessions: 'staff_members/sessions' }

  get 'staff_member/index', to: 'staff_members#index', as: :staff_member_index
  get 'family/index', to: 'families#index', as: :family_index

  root to: 'home#index'

  resources :staff_members, only: [:index]
  resources :patients, only: [:new, :create, :show, :edit, :update, :destroy]


end
