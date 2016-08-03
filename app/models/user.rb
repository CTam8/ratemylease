class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #validates :username, presence: true, uniqueness: { case_sensitive: false}
  devise :database_authenticatable, :omniauthable, :confirmable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]
  devise :omniauth_providers => [:facebook, :google_oauth2]
  #Authenticate using email or username
  # :confirmable,

  validates_presence_of   :avatar
  validates_integrity_of  :avatar
  validates_processing_of :avatar
  private
  def avatar_size_validation
    errors[:avatar] << "should be less than 500KB" if avatar.size > 0.5.megabytes
  end
  has_many :reviews

  def login=(login)
    @login = login
  end

  def self.find_for_oauth(auth, signed_in_resource = nil)
      if user = User.where(:email => auth.info.email).first()
        user
      else
        user = User.create(provider: auth.provider,
          :first_name => auth.info.first_name,
          :last_name => auth.info.last_name,
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
          #remote_avatar_url: auth.info.image
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

  validate :validate_first_name
  def validate_first_name
    if User.where(email: first_name).exists?
      errors.add(:first_name, :invalid)
    end
  end

end
