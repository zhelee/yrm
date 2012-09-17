class Topic < ActiveRecord::Base
  attr_accessible :description, :name, :topic_type, :events

  has_many :events

  rails_admin do
    label I18n.t("topic.title")
    label_plural I18n.t("topic.title")
  end
end
