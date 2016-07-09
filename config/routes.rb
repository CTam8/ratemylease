Rails.application.routes.draw do
  devise_for :users
  resources :users
root 'static_pages#home'

devise_scope :user do
  get "login", :to  => "devise/sessions#new"
  get "signup", :to  => "devise/registrations#new"
end

end
