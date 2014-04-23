class User < ActiveRecord::Base
  has_many :relationship_junctions
  has_many :organizations, through: :relationship_junctions

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true
end
