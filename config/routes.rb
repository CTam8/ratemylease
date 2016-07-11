Rails.application.routes.draw do
  devise_for :users
  resources :users
root 'static_pages#home'

devise_scope :user do
  get "login", :to  => "devise/sessions#new", :as => :new_user_session
  get "signup", :to  => "devise/registrations#new"
end

delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session


devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

end
