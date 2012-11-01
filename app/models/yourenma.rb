class Yourenma < ActiveRecord::Base

  belongs_to :topic
  belongs_to :user
  attr_accessible :description, :place, :user_id, :topic_id

  # PI = 3.1415926535
  RAD_PER_DEG = 0.017453293  #  PI/180

  Rmiles = 3956           # radius of the great circle in miles
  Rkm = 6371              # radius in kilometers...some algorithms use 6367
  Rfeet = Rmiles * 5282   # radius in feet
  Rmeters = Rkm * 1000    # radius in meters

  rails_admin do
    label I18n.t("yourenma.title")
    label_plural I18n.t("yourenma.title")
    field :topic do
      label I18n.t("topic.title")
    end
    field :user do
      label I18n.t("user.title")
    end
    field :description do
      label I18n.t("yourenma.attrs.description")
    end
    field :place do 
      label I18n.t("yourenma.attrs.place")
    end
  end

  def self.around
    users = user.around_me
    yrms = users.collect{|user| user.yourenmas }.flatten
    binding.pry
  end

  def self.haversine_distance( lat1, lon1, lat2, lon2 )
    distances = Hash.new

    dlon = lon2 - lon1
    dlat = lat2 - lat1

    dlon_rad = dlon * RAD_PER_DEG
    dlat_rad = dlat * RAD_PER_DEG

    lat1_rad = lat1 * RAD_PER_DEG
    lon1_rad = lon1 * RAD_PER_DEG

    lat2_rad = lat2 * RAD_PER_DEG
    lon2_rad = lon2 * RAD_PER_DEG

    a = Math.sin(dlat_rad/2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad/2)**2
    c = 2 * Math.asin( Math.sqrt(a))

    dMi = Rmiles * c          # delta between the two points in miles
    dKm = Rkm * c             # delta in kilometers
    dFeet = Rfeet * c         # delta in feet
    dMeters = Rmeters * c     # delta in meters

    distances["mi"] = dMi
    distances["km"] = dKm
    distances["ft"] = dFeet
    distances["m"] = dMeters

    distances
  end

end
