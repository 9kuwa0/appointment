Rails.application.routes.draw do
  devise_for :staff_members, controllers: { registrations: 'staff_members/registrations' }
  root to: 'home#index'

end
