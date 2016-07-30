Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :users

  resources :leases do
    resources :reviews, except:[:index, :show]
    collection do
      get 'search'
    end
  end

  root 'static_pages#home'
  get 'new_lease', :to => "leases#new"
  get 'all_leases', :to => "leases#index"


  devise_scope :user do
    get "login", :to  => "devise/sessions#new"
    get "signup", :to  => "devise/registrations#new"
    delete 'sign_out', :to => 'devise/sessions#destroy'
  end

  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup

end
