module ApplicationHelper
	def date(arg)
		arg.strftime("%m/%d/%Y") if arg
	end
	
	def time(arg)
		arg.strftime("%I:%M%P") if arg
	end
end
