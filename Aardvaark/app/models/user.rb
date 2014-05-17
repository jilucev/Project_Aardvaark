class User < ActiveRecord::Base
  has_many :relationship_junctions
  has_many :organizations, through: :relationship_junctions
  has_many :event_users
  has_many :events, through: :event_users
  has_secure_password

  # validates :firstname, presence: true
  # validates :lastname, presence: true
  validates :email, presence: true
  validates :password, length: { minimum: 2 }, allow_nil: true

  # before_validation(on: :create) do
  #   self.number = number.gsub(/[^0-9]/, "") if attribute_present?("number")
  # end

  # scope :with_vehicle, -> ( vehicle )  do
  #   where(vehicle: true)
  # end

  # scope :are_male, -> ( male ) do
  #   where(gender: male)
  # end

  # scope :are_female, -> (female) do
  #   where(gender: female)
  # end

  # scope :relevant_events, -> (organization) do
    # self.joins(oranizations: organization)
    # OR
    # Event.where(organization: org)
  # end

  def self.search_by_age(min, max)
    self.where("age BETWEEN ? AND ?", min, max)
  end

  def self.upcoming_events(user)
    Event.all.where("user_id = #{user.id}")
  end

  def self.open_events(user)
    user.events
  end

  def self.organizations_not_joined(user)
    # joins('LEFT JOIN relationship_junctions ON users.id = relationship_junctions.user_id').where(:'relationship_junctions.user_id' => nil)
    # joins('LEFT JOIN relationship_junctions ON users.id = relationship_junctions.organization_id')
    # @squirrel_faced_children_that_are_almost_unloveable_because_of_their_disgraceful_genes = RelationshipJunction.joins(:user).where(user_id: user.id)
    # RelationshipJunction.joins(:user).where(user_id: user.id)
    # RelationshipJunction.joins(:user).where("user_id = ? AND role_code = ?", user.id, 0)
    orgs = RelationshipJunction.joins(:user).where("user_id = ?", user.id).select("organization_id")
    Organization.where.not(id: orgs)
  end

  def self.organization_volunteer_pending(user)
    orgs = RelationshipJunction.joins(:user).where("user_id = ? AND role_code = ?", user.id, 0).select("organization_id")
    Organization.where(id: orgs)
  end

  def self.organizations_volunteering_at(user)
    orgs = RelationshipJunction.joins(:user).where("user_id = ? AND role_code != ?", user.id, 0).select("organization_id")
    Organization.where(id: orgs)
  end

  def self.belong_to_org?(org)
    users = RelationshipJunction.joins(:user).where("organization_id = ? AND role_code != ?", org.id, 0).select("user_id")
    User.where(id: users)
  end

  def self.organizer?(user)
    if RelationshipJunction.where("user_id = ? AND role_code = ?", user.id, 2).length == 0
      return false
    else
      return true
    end
  end

  def self.committed?(event)
    EventUser.where("event_id = ?", event.id)
  end

  def self.available?(event, belong_to_org)
    committed = EventUser.where("event_id = ?", event.id).select("user_id")
    belong_to_org.where.not(id: committed)
  end



end











