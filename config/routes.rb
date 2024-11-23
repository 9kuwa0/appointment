Rails.application.routes.draw do
  devise_for :families,      controllers: { registrations: 'families/registrations' }
  devise_for :staff_members, controllers: { registrations: 'staff_members/registrations' }

  get 'staff_member/index', to: 'staff_members#index', as: :staff_member_index
  get 'family/index', to: 'family#index', as: :family_index

  root to: 'home#index'

  resources :staff_members, only: [:index]
  resources :patients, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :families, only: [:index, :new, :create]



 
end
