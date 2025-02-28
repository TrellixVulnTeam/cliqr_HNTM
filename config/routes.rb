Rails.application.routes.draw do

  devise_for :users, :controllers => {:registrations => "users"}
  
  root "users#index"

  get 'answers/create'

  get 'questions/latest' => 'questions#latest'

  patch 'answers/:id/vet' => 'answers#vet', as: 'answer_vet'
  
  put 'answers/:id/vet' => 'answers#vet'

  patch 'questions/:id/vet' => 'questions#vet', as: 'question_vet'

  put 'questions/:id/vet' => 'questions#vet'

  resources :users do
    resources :questions, :answers
  end

  resources :questions do
    resources :votes, only: [:create, :destroy]

    resources :answers, except: [:index]
  end

  resources :answers do
    resources :votes, only: [:create, :destroy]
  end

  # resources :sessions

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
