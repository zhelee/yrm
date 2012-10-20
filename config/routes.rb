Yrm::Application.routes.draw do

  devise_for :admins

  resources :yourenmas

  match "webconsole" => "webconsole#index", :as => :webconsole_index
  match "webconsole/notify" => "webconsole#notify", :as => :send_notify

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users, :controllers => {
    :omniauth_callbacks => "users/omniauth_callbacks",
    :sessions => "users/sessions",
    :registrations => "users/registrations"
  }

  resources :token_authentications, :only => [:create, :destroy]

  namespace :api do
    namespace :v1 do
      resources :yourenmas
      resources :users do
        collection do
          post :login
          post :register
        end
      end
    end
  end

  root :to => 'pages#index'

end
