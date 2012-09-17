class Yourenma < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  attr_accessible :description, :place, :user_id, :topic_id

  rails_admin do
    label I18n.t("yourenma.title")
    label_plural I18n.t("yourenma.title")
  end
end
