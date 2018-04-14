class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: %i[google_oauth2 twitter github]
  has_many :notifications
  has_many :news_choosers
  has_many :tasks

  after_create do
    UserRegistrationMailer.delay.welcome_email(User.last)
  end

  def self.from_omniauth(auth, _signed_in_resource = nil)
    user = User.where(provider: auth.provider, uid: auth.uid).first
    if user.present?
      user
    else
      # Check wether theres is already a user with the same
      # email address
      user_with_email = User.find_by_email(auth.info.email)
      if user_with_email.present?
        user = user_with_email
      else
        user = User.new

        if auth.provider == 'github'

          user.provider = auth['provider']
          user.uid = auth['uid']

          user.oauth_user_name = auth['info']['name']
          user.email = auth['info']['email']
          user.save

        elsif auth.provider == 'twitter'

          user.provider = auth.provider
          user.uid = auth.uid
          user.oauth_token = auth.credentials.token

          user.oauth_expires_at = auth.extra.raw_info.name

        elsif auth.provider == 'google_oauth2'

          user.provider = auth.provider
          user.uid = auth.uid
          user.oauth_token = auth.credentials.token

          user.first_name = auth.info.first_name
          user.last_name = auth.info.last_name
          user.email = auth.info.email
          # Google's token doesn't last forever
          user.oauth_expires_at = Time.at(auth.credentials.expires_at)
          user.save
        end
      end
    end
    user
  end

  # For Twitter (save the session eventhough we redirect user to registration page first)
  def self.new_with_session(params, session)
    if session['devise.user_attributes']
      new(session['devise.user_attributes']) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
    
  end

  # For Twitter (disable password validation)
  def password_required?
    super && provider.blank?
  end
end
