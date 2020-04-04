class Event < ApplicationRecord
  has_many :event_participants
  has_one :event_pricing

  def free_event?
    event_pricing.blank?
  end

  def ticket_price
    event_pricing.present? ? event_pricing.price : 'Free'
  end

  def multi_day_event?
    start_date.present? && end_date.present?
  end

  def discounted_price
    if event_pricing.present?
      price = event_pricing.price
      (price - price * 5/100)
    else
      "Free"
    end
  end
end
