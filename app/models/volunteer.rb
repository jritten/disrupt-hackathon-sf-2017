class Volunteer < ActiveRecord::Base
  has_many :gigs
  has_many :kids, through: :gigs
  has_many :parents, through: :kids
end
