Rails.application.routes.draw do
  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    passwords: 'customers/passwords',
    registrations: 'customers/registrations'
  }
  root to: 'customer/homes#top'
  get '/homes/about' => 'customer/homes#about'

  # admin側のdeviseコントローラーを作成し、それがどこにあるか指定している
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
  # 顧客ページ関連
  get '/customers/my_page' => 'customer/customers#show'
  get '/customers/edit_self' => 'customer/customers#edit'
  patch '/customers_update' => 'customer/customers#update'
  get '/customers/check' => 'customer/customers#check'
  patch '/customers/out' => 'customer/customers#out'

  scope module: :customer do
  # shipping_addressesコントローラー関連
  resources :shipping_addresses, only: [:index, :create, :destroy, :edit, :update]
  # customer側のproductsコントローラー関連
  resources :products, only: [:index, :show]
  # cart_productsコントローラー関連
  resources :cart_products, only: [:index, :create, :update, :destroy]
  get '/cart_products/destroy_all' => 'cart_products#destroy_all'
  # orderコントローラー関連
  get '/orders/confilm' => 'orders#confilm'
  get '/orders/done' => 'orders#done'
  resources :orders, only: [:new, :show, :index]
  end

  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :order_products, only: [:update]
    resources :products, only: [:index, :show, :new, :create, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
  end
end
