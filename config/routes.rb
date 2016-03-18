Rails.application.routes.draw do
  # devise_for :users
  # per: https://github.com/plataformatec/devise#getting-started
  #   "you can customize each controller", "Tell the router to use this
  #   controller"
  # and for oauth per:
  #   https://github.com/plataformatec/devise/wiki/OmniAuth:-Overview
  devise_for :users,
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations',
               passwords: 'users/passwords',
               confirmations: 'users/confirmations',
               omniauth_callbacks: 'users/omniauth_callbacks'
             }

  resources :users, only: [:index, :show]
  get '/settings', to: 'users#settings', as: 'settings'

  resources :registered_applications,
            only: [:index, :show, :new, :create, :edit, :update, :destroy]

  # -------------------------------
  # App:
  # Landing page, About
  root 'pages#welcome'
  get  'about', to: 'pages#about'
  get '/welcome/new', to: 'pages#welcome_new', as: 'welcome_new'
  get '/welcome/back', to: 'pages#welcome_back', as: 'welcome_back'
  # -------------------------------

  #-------------------------------
  # Event api
  namespace :api, defaults: { format: :json } do
    # Catch the Http OPTION verb for cross-origin resource sharing (CORS).
    match '/events', to: 'events#preflight', via: [:options]
    resources :events, only: [:create]
  end

  # The priority is based upon order of creation:
  # first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically)
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
