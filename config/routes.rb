Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :cocktails do
    collection do
      get :top
    end

    resources :doses, only: [:create]
    
  end

  resources :ingredients, only: [:index] do
    member do
      get :doses
    end
  end

  resources :doses, only: [:index, :new, :create, :update, :edit, :destroy]

end
