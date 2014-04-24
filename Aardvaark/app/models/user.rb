class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :relationship_junctions
  has_many :organizations, through: :relationship_junctions

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true
end
