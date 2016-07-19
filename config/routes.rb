Rails.application.routes.draw do
<<<<<<< HEAD
  devise_for :users, :path => '', :path_names => { :sign_in => "login", :sign_up => "signup"}
=======
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
>>>>>>> facebook-auth
  resources :users
root 'static_pages#home'

devise_scope :user do
  get "login", :to  => "devise/sessions#new"
  get "signup", :to  => "devise/registrations#new"
  delete 'sign_out', :to => 'devise/sessions#destroy'
end

match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup

end
