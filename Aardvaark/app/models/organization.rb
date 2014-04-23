class Organization < ActiveRecord::Base
  has_many :relationship_junctions
  has_many :events
  has_many :users, through: :relationship_junctions
end
