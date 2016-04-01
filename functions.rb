#  functions.rb
#  
#  Copyright 2016 muhammad <muhammad@muhammad-ThinkPad-T420>
#  
#  

require 'readline' # Readline is a library that allows us to interact with the user to get user input.
require 'date' # 

def query_user_date_range
	
	start_date = nil
	end_date = nil
	
	puts "\nFirst, Start Date"
	start_date = query_user_for_date
	
	puts "\nNext, End Date"
	end_date = query_user_for_date
	
	# return two values of array
	return start_date, end_date
end


def query_user_for_date
	
	# Create a variable date object
	date = nil
	
	# Keep looping until a date variable is an actual date object
	until date.is_a? Date
		
		prompt = "Please insert a date as YYYY-MM-DD:"
		response = Readline.readline(prompt, true) # get an input
		
		# Defensive test prompt for other options than a date
		exit if ['quit', 'exit', 'q', 'x'].include?(response)
		
		# Defensive test block to check a format for date object
		begin
			date = Date.parse(response)
		rescue ArgumentError
			puts "\nInvalid date format"
		end
		
	end
		
	return date
end
