Rails.application.routes.draw do

  namespace :api do
      namespace :v1 do
        resources :weather, only: [:index]
        resources :book, only: [:index]
    end
  end
end
