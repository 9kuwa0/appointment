Rails.application.routes.draw do
  devise_for :families,      controllers: { registrations: 'families/registrations', sessions: 'families/sessions'}
  devise_for :staff_members, controllers: { registrations: 'staff_members/registrations', sessions: 'staff_members/sessions' }

  get 'patient/index', to: 'patients#index', as: :patient_member_index
  get 'promise/index', to: 'promises#index', as: :promise_index

  root to: 'home#index'

  resources :patients
  resources :promises do
    collection do
      get 'search', to: 'promises#search'
    end
  end
end
