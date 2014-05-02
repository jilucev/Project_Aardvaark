class User < ActiveRecord::Base
  has_many :relationship_junctions
  has_many :organizations, through: :relationship_junctions
  has_secure_password
  
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true
  validates :password, length: { minimum: 2 }, allow_nil: true

  # before_validation(on: :create) do
  #   self.number = number.gsub(/[^0-9]/, "") if attribute_present?("number")
  # end

  scope :with_vehicle, -> ( vehicle )  do
    where(vehicle: true)
  end

  scope :are_male, -> ( male ) do
    where(gender: male)
  end

  scope :are_female, -> (female) do
    where(gender: female)
  end

  scope :relevant_events, -> (organization) do
    # self.joins(oranizations: organization)
    # OR
    # Event.where(organization: org)
  end

  def self.search_by_age(min, max)
    self.where("age BETWEEN ? AND ?", min, max)
  end

  def relevant_events
    events = []
    @organizations = Organization.all
  #   @organizations.each do |organization|
  #   events += organization.events
  #   end
  #   events.flatten
  end
end