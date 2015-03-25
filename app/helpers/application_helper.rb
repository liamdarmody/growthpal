module ApplicationHelper
  def title(value)
    unless value.nil?
      @title = "#{value} | Growthpal"
    end
  end
end
