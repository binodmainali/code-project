module ApplicationHelper
  def title(value)
    unless value.nil?
      @title = "#{value} | EventExample"
    end
  end
end
