class Yourenma < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  attr_accessible :description, :place, :user_id, :topic_id
end
