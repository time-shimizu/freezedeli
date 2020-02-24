Rails.application.routes.draw do
  namespace :freezedeli do
    get 'orders/edit'
  end
  mount Spree::Core::Engine, at: '/'

  namespace :freezedeli do
    get '/',          to: 'static_pages#index'
    get '/index',     to: 'static_pages#index'
    get '/about',     to: 'static_pages#about'
    resources :products, only: :show
    resources :categories, only: :show
    get 'cart',       to: 'orders#edit'
    patch 'cart',     to: 'orders#update'
    resources :line_items, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
