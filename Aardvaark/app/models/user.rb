class User < ActiveRecord::Base
  has_many :relationship_junctions
  has_many :organizations, through: :relationship_junctions
  has_secure_password
  
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true

  scope :with_vehicle, -> ( vehicle )  do
    where(vehicle: true)
  end

  scope :are_male, -> ( male ) do
    where(gender: male)
  end

  scope :are_female, -> (female) do
    where(gender: female)
  end

  def self.search_by_age(min, max)
    self.where("age BETWEEN ? AND ?", min, max)
  end

  def relevant_events
    events = []
    organizations.each do |organization|
    events += organization.events
    end
    events.flatten
  end
end
