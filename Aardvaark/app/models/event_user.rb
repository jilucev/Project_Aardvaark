class EventUser < ActiveRecord::Base
  belongs_to :users
  belongs_to :events
end
