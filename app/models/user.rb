class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #validates :username, presence: true, uniqueness: { case_sensitive: false}
  devise :database_authenticatable, :omniauthable, :registerable, :recoverable, :rememberable, :trackable, :confirmable, :validatable, :authentication_keys => [:login]
  devise :omniauth_providers => [:facebook, :google_oauth2]
  #Authenticate using email or username
  def login=(login)
    @login = login
  end

  def self.find_for_oauth(auth, signed_in_resource = nil)

      if user = User.where(:email => auth.info.email).first
        user.skip_confirmation!
        user.save!
        user
      else
        user = User.new(provider: auth.provider,
          #:name => auth.extra.raw_info.name,
          #:email => email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com",
          :email => auth.info.email,
          #password: Devise.friendly_token[0,20]
          :password => Devise.friendly_token[0,20]
        )
        user.skip_confirmation!
        user.save!
      end
  end

  #def email_verified?
  #  self.email && self.email !~ TEMP_EMAIL_REGEX
  #end

def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.provider = auth.provider
    user.uid = auth.uid
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.skip_confirmation!
    user.save!
  end
end


def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def login
    @login = self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where("lower(email) = :value", { :value => login.downcase }).first
    elsif conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end

=begin
  validate :validate_username

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
  end
=end
end
