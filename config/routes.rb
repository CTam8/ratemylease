Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users
root 'static_pages#home'

devise_scope :user do
  get "login", :to  => "devise/sessions#new"
  get "signup", :to  => "devise/registrations#new"
  delete 'sign_out', :to => 'devise/sessions#destroy'
end

end
