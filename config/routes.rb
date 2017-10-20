Rails.application.routes.draw do
  resources :companies do
    collection do
      get :filter_on_map
      get :filter_on_selects
      get :filter_on_country_select
      get :filter_on_city_select
      get :search
    end
  end

  get '/companies/:name', to: 'companies#index', as: 'test'
  get '/about', to: 'static_pages#about'
  get '/legal', to: 'static_pages#legal'
  get '/help', to: 'static_pages#help'
  get '/sponsor', to: 'static_pages#sponsor'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	resources :countries , only: [:new, :create, :index]

	root 'companies#index'

end
