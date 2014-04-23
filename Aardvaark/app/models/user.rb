class User < ActiveRecord::Base
  has_many :relationship_junctions
  has_many :organizations, through: :relationship_junctions
end
