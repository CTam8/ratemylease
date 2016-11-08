class User < ActiveRecord::Base

  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :omniauthable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:email]
  devise :omniauth_providers => [:facebook, :google_oauth2]
<<<<<<< HEAD
  #Authenticate using email or username
  # :confirmable,
  attr_accessor :remember_me
=======
  #Authenticate using email or username :confirmable,
>>>>>>> lease-geocoder

  #attr_accessor :email, :password, :password_confirmation, :remember_me, :remote_avatar_url, :avatar_cache, :remove_avatar
  validates_presence_of :first_name

  has_many :reviews, dependent: :destroy


  def user_params
    params.require(:users).permit(:email, :password, :password_confirmation, :created_at, :updated_at,
    :remember_me, :firstname, :lastname, :typeofuser, :avatar, :remote_avatar_url)
  end

  def self.find_for_oauth(auth, signed_in_resource = nil)
      if user = User.where(:email => auth.info.email).first()
        user
      else
        user = User.create(provider: auth.provider,
          :first_name => auth.info.first_name,
          :last_name => auth.info.last_name,
          :remote_avatar_url => auth.info.image,
          :email => auth.info.email,
          :password => Devise.friendly_token[0,20]
        )
        user.skip_confirmation!
        user.save!
      end
  end

  def self.from_omniauth(auth)
        where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
          user.provider = auth.provider
          user.uid = auth.uid
          user.first_name = auth.info.first_name
          user.last_name = auth.info.last_name
          user.email = auth.info.email
          user.remote_avatar_url = auth.info.image
          user.password = Devise.friendly_token[0,20]
      end
  end


  def self.new_with_session(params, session)
      super.tap do |user|
        if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
          user.email = data["email"] if user.email.blank?
        end
      end
  end

  def validate_password?(pwd)
      true
    end


end
