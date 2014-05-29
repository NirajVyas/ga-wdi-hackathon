Contacts::Application.routes.draw do

  devise_for :users, controllers: {omniauth_callbacks: 'omniauth_callbacks'}

  resources :contacts
  resources :collages
  get 'apicalls/instagram', to:  'apicalls#instagram', as: 'instagram_api'
  root to: 'contacts#index'
end
