Rails.application.routes.draw do
  resources :cats
  resources :cat_rental_requests do
    post "approve", to: "cat_rental_requests#approve"
    post "deny", to: "cat_rentalrequests#deny"
  end
  
  resource :user, only: [:new, :create, :show]
  resource :session
  
end
