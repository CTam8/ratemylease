Rails.application.routes.draw do
  devise_for :users, :path => '', :path_names => { :sign_in => "login", :sign_up => "signup"}
  resources :users
root 'static_pages#home'

get 'lease', :to => 'lease#new'

devise_scope :user do
  get "login", :to  => "devise/sessions#new"
  get "signup", :to  => "devise/registrations#new"
end

end
