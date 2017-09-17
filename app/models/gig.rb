class Gig < ActiveRecord::Base
  has_many :kids
  belongs_to :volunteer
  has_many :parents, { through: :kids }
end
