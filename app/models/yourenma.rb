class Yourenma < ActiveRecord::Base
  belongs_to :yrm_topic
  belongs_to :user
  attr_accessible :description, :place
end
