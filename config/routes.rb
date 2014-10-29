Rails.application.routes.draw do
  resources :cats
  resources :cat_rental_requests do
    post "approve", to: "cat_rental_requests#approve"
  end
end
