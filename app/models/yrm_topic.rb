class YrmTopic < ActiveRecord::Base
  attr_accessible :title

  has_many :yourenma, :class_name => "Yourenma"
end
