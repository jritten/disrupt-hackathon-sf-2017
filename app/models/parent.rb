class Parent < ActiveRecord::Base
  has_many :kids
  has_many :gigs { through: :kids }
end
