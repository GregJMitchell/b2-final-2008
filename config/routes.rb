Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :doctors, only: [:show]
  delete "/doctors/:id/remove_patient", to: "doctors#remove_patient"

  resources :patients, only: [:index]

  resources :hospitals, only: [:show]
end
