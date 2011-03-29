module ApplicationHelper
  def time(arg)
	return arg.strftime("%I:%M %p") if !arg.nil?
  end
end
