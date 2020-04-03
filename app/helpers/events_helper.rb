module EventsHelper
  def multi_day_event(event)
    event.start_date.present? && event.end_date.present?
  end
end
