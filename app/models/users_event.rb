class UsersEvent < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  # attr_accessible :title, :body
end
