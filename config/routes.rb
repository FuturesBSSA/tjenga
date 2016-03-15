Rails.application.routes.draw do
  root to: "pages#home"

  devise_for :developers #, :controllers => { registrations: 'registrations' }
  devise_for :clients

  resources :jobs, only: [:index, :show] do
    resources :applications, only: [:new, :create]
  end

  resources :developers, only: [:index, :show] do
    resources :recommendations, only: [:new, :create]
  end

  namespace :developer do
    resource :profile, only: [:show, :edit, :update]

    resources :applications, only: [:index, :show] do
      member do
        get :confirmation
      end

      resources :reviews, only: [:new, :create]
    end
  end

  namespace :client do
    resource :profile, only: [:show, :edit, :update]

    resources :jobs do
      member do
        patch  :close
      end

      resources :reviews, only: [:new, :create]
    end

    resources :applications, only: [:index, :show] do
      member do
        patch :accept
        patch :decline
      end
    end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
