class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :authentication_token, :place
  attr_accessible :birthday, :constellation, :description
  attr_accessible :acs_uid, :acs_password, :location
  # attr_accessible :title, :body
  attr_accessible :provider, :uid

  has_many :users_events
  has_many :events, :through => :users_events
  has_many :yourenmas

  before_save :ensure_authentication_token

  rails_admin do
    label I18n.t("user.title")
    label_plural I18n.t("user.title")
    object_label_method :username
    field :username do
      label I18n.t("user.attrs.username")
    end
    field :email do
      label I18n.t("user.attrs.email")
    end
    field :password do
      label I18n.t("user.attrs.password")
    end
    field :password_confirmation do
      label I18n.t("user.attrs.password_confirmation")
    end
    field :acs_uid
    field :acs_password
    field :location
  end

  def around_me
    users = []
    User.find_each do |u|
      distance = Yourenma.haversine_distance(u.lat, u.lon, self.lat, self.lon)['km']
      users << u if distance <= 50
    end
    users
  end

  def distance_with u
    Yourenma.haversine_distance(u.lat, u.lon, self.lat, self.lon)['km']
  end

  def lat
    location.split(':')[0].to_f
  end

  def lon
    location.split(':')[1].to_f
  end

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
