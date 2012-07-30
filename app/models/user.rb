class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username
  # attr_accessible :title, :body
  attr_accessible :provider, :uid

  has_many :users_events
  has_many :events, :through => :users_events

  def self.find_for_weibo_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => "#{auth.uid}").first
    unless user
      user = User.create(
        username: auth.extra.raw_info.name, 
        provider: auth.provider,
        uid: auth.uid,
        email: auth.info.email,
        password: Devise.friendly_token[0,20]
      )
    end
    user
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.weibo_data"]
        user.email = data["email"] if user.email.blank?
        user.username = data["name"]
        user.provider = session["devise.weibo_data"]["provider"]
        user.uid = session["devise.weibo_data"]["uid"]
        user.save if params.any?
      end
    end
  end

end
