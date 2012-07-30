class Topic < ActiveRecord::Base
  attr_accessible :description, :name, :topic_type, :events

  has_many :events
end
