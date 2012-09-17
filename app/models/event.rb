class Event < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  attr_accessible :description, :name
  attr_accessible :topic_id, :user_id

  has_many :users_events
  has_many :users, :through => :users_events

  rails_admin do
    label I18n.t("event.title")
    label_plural I18n.t("event.title")
  end
end
