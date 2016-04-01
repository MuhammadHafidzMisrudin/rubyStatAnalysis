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
	
	puts "\n First, Start Date"
	start_date = query_user_for_date
	
	puts "\n Next, End Date"
	end_date = query_user_for_date
	
	# return two values of array
	return start_date, end_date
end


def query_user_for_date

	return nil

end
