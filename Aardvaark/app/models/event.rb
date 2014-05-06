class Event < ActiveRecord::Base
  belongs_to :organization
  has_many :users, through: :event_users
end
