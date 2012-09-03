Yrm::Application.routes.draw do

  match "webconsole" => "webconsole#index", :as => :webconsole_index
  match "webconsole/notify" => "webconsole#notify", :as => :send_notify

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users, :controllers => {
    :omniauth_callbacks => "users/omniauth_callbacks",
    :sessions => "users/sessions",
    :registrations => "users/registrations"
  }

  resources :token_authentications, :only => [:create, :destroy]

  root :to => 'pages#index'

end
