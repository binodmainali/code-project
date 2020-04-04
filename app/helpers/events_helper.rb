module EventsHelper
  def time_format time
    time.strftime("%B %d, %Y")
  end
end
