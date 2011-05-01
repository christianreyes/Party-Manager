module ApplicationHelper
	def date_str(arg)
		arg.strftime("%m/%d/%Y") if arg
	end
	
	def time_str(arg)
		arg.strftime("%I:%M%P") if arg
	end
end
