class Attraction < ActiveRecord::Base
  # write associations here
  validates :name, presence: true
  validates :tickets, presence: true
  validates :nausea_rating, presence: true
  validates :min_height, presence: true
  validates :happiness_rating, presence: true 

end
