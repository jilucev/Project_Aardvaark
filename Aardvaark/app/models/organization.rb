class Organization < ActiveRecord::Base
  has_many :relationship_junctions
  has_many :events
  has_many :users, through: :relationship_junctions
  has_secure_password
  
  validates :name, presence: true
  validates :email, presence: true

  # before_validation(on: :create) do
  #   self.number = number.gsub(/[^0-9]/, "") if attribute_present?("number")
  # end  

  def self.find_requests(org)
    org.users.where("role_code = 0")
  end

  def self.find_volunteers(org)
    org.users.where("role_code = 1")
  end

  def self.find_volunteer_supers(org)
    org.users.where("role_code = 2")
  end

end
