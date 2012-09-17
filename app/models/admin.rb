class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  rails_admin do
    label I18n.t("admin.title")
    label_plural I18n.t("admin.title")
    field :email do
      label I18n.t("admin.attrs.email")
    end
    field :password do
      label I18n.t("admin.attrs.password")
    end
    field :password_confirmation do
      label I18n.t("admin.attrs.password_confirmation")
    end
  end
end
