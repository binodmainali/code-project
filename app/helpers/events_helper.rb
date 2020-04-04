module EventsHelper
  def multi_day_event(event)
    event.start_date.present? && event.end_date.present?
  end

  def discounted_price(event)
    if event.event_pricing.present?
      price = event.event_pricing.price
      (price - price * 5/100)
    else
      "Free"
    end
  end
end
