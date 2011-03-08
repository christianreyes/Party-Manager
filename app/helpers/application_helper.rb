module ApplicationHelper
	def string_to_date(str)
		return Date.strptime(str, '%m/%d/%Y')
	end
end
