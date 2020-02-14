Rails.application.routes.draw do
  namespace :freezedeli do
    get 'static/show'
  end
  mount Spree::Core::Engine, at: '/'

  namespace :freezedeli do
    get '/',          to: 'static_pages#index'
    get '/index',     to: 'static_pages#index'
    get '/about',     to: 'static_pages#about'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
