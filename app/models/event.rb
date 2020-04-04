class Event < ApplicationRecord
  has_many :event_participants
  has_one :event_pricing

  def free_event?
    event_pricing.blank?
  end

  def ticket_price
    event_pricing.present? ? event_pricing.price : 'Free'
  end
end
