Rails.application.routes.draw do
  namespace :api do
      namespace :v1 do

      namespace :merchants do
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
        get '/random', to: 'random#show'

        get '/:id/items', to: 'items#index'
        get '/:id/invoices', to: 'invoices#index'
      end

      resources :merchants, only: [:index, :show]

      namespace :customers do
        get '/find_all', to: 'search#index'
        get '/find', to: 'search#show'
        get '/random', to: 'random#show'
      end

      resources :customers, only: [:index, :show]

      namespace :items do
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
        get '/random', to: 'random#show'
      end

      resources :items, only: [:index, :show]

      namespace :invoices do
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
        get '/random', to: 'random#show'
      end

      resources :invoices, only: [:index, :show]
    end
  end
end
