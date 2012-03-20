Rails.application.routes.draw do
  namespace :admin do
    resources :users do
      member do
        put :generate_api_key
        put :clear_api_key
      end
    end
  end

 namespace :api do
    resources :taxonomies
   match '/t/*id', :to => 'taxons#show', :as => :nested_taxons
    resources :taxonomies do
      member do
        get :get_children
      end
      resources :taxons
    end
    resources :adjustments
    resources :shipping_categories
     resources :shipping_methods
     resources :promotions
    # resources :promotions do
      # # resources :promotion_rules
      # # resources :promotion_actions
    # end
    resources :tax_categories
    resources :zones
    # resources :payments do
        # member do
          # put :fire
        # end
      # end
    resources :product_groups
    resources :tax_rates
    resources :payment_methods
    resources :variants
    resources :products do
      resources :product_properties
      resources :images do
        collection do
          post :update_positions
        end
      end
    end

    resources :shipments, :except => [:new,:edit] do
      put :event, :on => :member
      resources :inventory_units, :except => [:new,:edit] do
        put :event, :on => :member
      end
    end
     resources :creditcards
    resources :creditcard_payments
    resources :option_types
    resources :properties
    resources :prototypes
    resources :shipping_methods
    resources :mail_methods do
      member do
        post :testmail
      end
    end
    resources :reports, :only => [:index, :show] do
      collection do
        get :sales_total
      end
    end
    match '/checkout/update/:state' => 'checkout1#update', :as => :update_checkout ,:via=>:put
    #match '/checkout/update/:state', :to => 'checkout#update_order',:via=>:put
  #match '/checkout/:state', :to => 'checkout#edit', :as => :checkout_state, :via => :get
  #match '/checkout', :to => 'checkout#edit', :state => 'address', :as => :checkout
  #match '/checkout/payment', :to => 'checkout#payment', :via => :put
match '/overview/best_selling_products', :to => 'overview#best_selling_products', :via => :get
match '/overview/gross_selling_products', :to => 'overview#gross_selling_products', :via => :get
match '/overview/top_spenders', :to => 'overview#top_spenders', :via => :get
match '/overview/recent_orders', :to => 'overview#recent_orders', :via => :get
match '/overview/out_of_stock', :to => 'overview#out_of_stock', :via => :get
match '/overview/day_order_count', :to => 'overview#day_order_count', :via => :get
match '/overview/day_order_value', :to => 'overview#day_order_value', :via => :get
match '/overview/month_order_value', :to => 'overview#month_order_value', :via => :get
match '/overview/month_order_count', :to => 'overview#month_order_count', :via => :get
match '/products/add',:to=>'products#add',:via=>:post
#match '/products/remove',:to=>'products#remove',:via=>:delete
    # resources :images
    resources :orders, :except => [:new,:edit] do
      put :event, :on => :member
      resources :shipments, :except => [:new,:edit]
      resources :line_items, :except => [:new,:edit]
      resources :inventory_units, :except => [:new,:edit] do
        put :event, :on => :member
      end
    end
    resources :line_items,:only=>[:create]
    resources :inventory_units, :except => [:new,:edit] do
      put :event, :on => :member
    end
    resources :users , :except => [:new,:edit]
    resources :user_sessions do
       put :event, :on => :member
     end   
    resources :products, :except => [:new,:edit] do
      member do
         delete :remove
       end
     end
      resources :orders do
      member do
        put :fire
        get :fire
        post :resend
        get :history
        get :user
      end

      resources :adjustments
      resources :line_items
      resources :shipments do
        member do
          put :fire
        end
      end
      resources :return_authorizations do
        member do
          put :fire
        end
      end
      resources :payments do
        member do
          put :fire
        end
      end
    end
    resources :countries
    resources :countries do
      resources :states
    end
          resources :states
     
  end

end
