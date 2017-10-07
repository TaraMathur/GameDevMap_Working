Rails.application.routes.draw do
  resources :companies

  get '/about', to: 'static_pages#about'
  get '/legal', to: 'static_pages#legal'
  get '/help', to: 'static_pages#help'
  get '/sponsor', to: 'static_pages#sponsor'

  get 'companies/update_stateprovs'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	resources :countries , only: [:new, :create, :index]

#	root 'static_pages#mygraph'
	root 'companies#index'

end
