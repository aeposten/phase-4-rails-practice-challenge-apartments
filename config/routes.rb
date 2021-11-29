Rails.application.routes.draw do
  resources :apartments
  resources :tenants
  resources :leases, only: [:index, :show, :create, :destroy]
end
