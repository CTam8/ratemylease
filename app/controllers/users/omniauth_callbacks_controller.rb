class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def provider
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.find_for_oauth(request.env["omniauth.auth"])

    if @user.persisted?
      flash.notice = "Signed in!"
      @user.skip_confirmation!
      @user.save!
      @user
      sign_in_and_redirect (@user)
  else
      session["devise.#{provider}_data"] = env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  alias_method :google_oauth2, :provider
  alias_method :facebook, :provider


  def failure
    redirect_to root_path
  end
end
