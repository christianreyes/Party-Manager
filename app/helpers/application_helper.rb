module ApplicationHelper
	def string_to_date(str)
		return Date.strptime(str, '%m/%d/%Y') if str.match(/\d+\/\d+\/\d+/)
		return Date.parse(str) if str.match(/[A-Z][a-z]+ \d+, \d+/)
		return nil
	end
end
