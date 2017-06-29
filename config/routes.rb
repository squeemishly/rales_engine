Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
     namespace :v1 do

       namespace :merchants do
        get "/find_all",             to: "find#index"
        get "/find",                 to: "find#show"
        get "/random",               to: "random#show"
        get "/:id/items",            to: "item#index"
        get "/:id/invoices",         to: "invoice#index"
        get "/most_revenue",         to: "most_revenue#index"
        get "/:id/revenue",          to: "revenue#show"
       end

       resources :merchants, only: [:index, :show]

       namespace :customers do
         get '/find_all',             to: 'find#index'
         get '/find',                 to: 'find#show'
         get '/:id/invoices',         to: 'invoice#index'
         get '/:id/invoices',         to: 'invoice#index'
         get '/:id/transactions',     to: 'transaction#index'
       end

       resources :customers, only: [:index, :show]

       namespace :invoices do
         get '/find',                 to: 'find#show'
         get '/find_all',             to: 'find_all#index'
         get '/:id/invoice_items',    to: 'invoice_items#index'
         get '/:id/items',            to: 'items#index'
         get '/:id/merchant',         to: 'merchant#show'
         get '/:id/customer',         to: 'customer#show'
         get '/:id/transactions',     to: 'transactions#index'
       end

      resources :invoices, only: [:index, :show]

      namespace :transactions do
         get "/find",                 to: "find#show"
         get "/find_all",             to: "find#index"
         get '/:id/invoice',          to: 'transactions_invoice#show'
       end

      resources :transactions, only: [:index, :show]

       namespace :items do
         get '/find', to: 'find#show'
         get '/find_all', to: 'find#index'
         get "/:id/invoice_items", to: "items_invoice_items#show"
         get "/:id/merchant", to: "items_merchants#show"
         get '/most_revenue', to: "most_revenue#index"
       end

      resources :items, only: [:index, :show]

      namespace :invoice_items do
        get '/find',                  to: 'find#show'
        get '/find_all',              to: 'find#index'
        get "/:id/invoice",           to: "invoice_items_invoice#show"
        get "/:id/item",              to: "invoice_items_item#show"
      end

      resources :invoice_items, only: [:index, :show]
     end
   end
end
