Rails.application.routes.draw do
  devise_for :staff_members
  root to: 'home#index'

end
