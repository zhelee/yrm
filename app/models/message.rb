class Message < ActiveRecord::Base
  belongs_to :from_user, :class_name => :User
  belongs_to :to_user, :class_name => :User
  attr_accessible :content, :from_user_id, :to_user_id
end
