Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
     namespace :v1 do

       namespace :merchants do
        get "/find_all", to: "find#index"
        get "/find", to: "find#show"
        get "/random", to: "random#show"
        get "/:id/items", to: "item#index"
        get "/:id/invoices", to: "invoice#index"
       end

       resources :merchants, only: [:index, :show]

       namespace :customers do
         get "/find_all", to: "find#index"
         get "/find", to: "find#show"
         get '/:id/invoices', to: 'invoice#index'
         get '/:id/invoices', to: 'invoice#index'
         get '/:id/transactions', to: 'transaction#index'
       end

       resources :customers, only: [:index, :show]

       namespace :invoices do
         get '/find', to: 'find#show'
         get '/find_all', to: 'find_all#index'
       end

       resources :invoices, only: [:index, :show]

       namespace :transactions do
         get "/find", to: "find#show"
         get "/find_all", to: "find#index"
       end

       resources :transactions, only: [:index, :show] do
         get '/invoice', to: 'transactions/transactions_invoice#show'
       end

       namespace :items do
         get '/find', to: 'find#show'
         get '/find_all', to: 'find#index'
       end

       resources :items, only: [:index, :show] do
        get "/invoice_items", to: "items/items_invoice_items#show"
        get "/merchant", to: "items/items_merchants#show"
      end

      namespace :invoice_items do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
      end

       resources :invoice_items, only: [:index, :show]
     end
   end
end
