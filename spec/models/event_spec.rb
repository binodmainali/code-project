require 'rails_helper'

RSpec.describe Event, type: :model do
  before(:each) do
    @event = Event.create(
        name: "test_event",
        start_date: Time.zone.now + 12.days,
        end_date: Time.zone.now + 12.days,
        location: "Bangalore",
        description: "Welcome to the biggest party of the year filled with music and dance"
    )
  end

  describe "free event" do
    it "should return true for free events" do
      expect(@event.reload.free_event?).equal?(true)
    end
    it "should return false for paid events" do
      @paid_event = EventPricing.new(event_id: @event.id, price: nil).save!
      expect(@event.reload.free_event?).equal?(false)
    end
  end

  describe "#ticket_price" do
    it "should return Free for free events" do
      expect(@event.reload.ticket_price).equal?('Free')
    end

    it "should return Free for free events" do
      EventPricing.new(event_id: @event.id, price: 1200.00).save!
      expect(@event.reload.ticket_price).equal?(1200.00)
    end
  end
end
