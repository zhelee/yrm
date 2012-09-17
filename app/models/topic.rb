class Topic < ActiveRecord::Base
  attr_accessible :description, :name, :topic_type, :events

  has_many :events

  rails_admin do
    label I18n.t("topic.title")
    label_plural I18n.t("topic.title")
    field :name do
      label I18n.t("topic.attrs.name")
    end
    field :topic_type do
      label I18n.t("topic.attrs.type")
    end
    field :description do
      label I18n.t("topic.attrs.description")
    end
  end
end
