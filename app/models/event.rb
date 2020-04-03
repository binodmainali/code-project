class Event < ApplicationRecord
  has_many :event_participants
  has_one :event_pricing
end
