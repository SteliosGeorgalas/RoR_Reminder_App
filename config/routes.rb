Rails.application.routes.draw do
  resources :reminder_lists
  root 'reminder_lists#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
