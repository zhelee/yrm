class Yourenma < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  attr_accessible :description, :place, :user, :topic, :user_id, :topic_id

  validates_presence_of :user, :topic, :place, :description

  rails_admin do
    label I18n.t("yourenma.title")
    label_plural I18n.t("yourenma.title")
    field :topic do
      label I18n.t("topic.title")
    end
    field :user do
      label I18n.t("user.title")
    end
    field :description do
      label I18n.t("yourenma.attrs.description")
    end
    field :place do 
      label I18n.t("yourenma.attrs.place")
    end
  end
end
