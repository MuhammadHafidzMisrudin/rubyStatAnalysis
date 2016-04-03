#  functions.rb
#  
#  Copyright 2016 muhammad <muhammad@muhammad-ThinkPad-T420>
#  
#  

require 'readline' # Readline is a library that allows us to interact with the user to get user input.
require 'date'
require 'open-uri'


# Declare a constant global variable, the earliest date
DATA_START_DATE = '2006-09-20'

# Declare the maximum number of days that can be retrieved (Remote server)
MAX_DAYS = 7

# Reading Type variable as a hash (key, value)
# Each key is used to locate data
# Each value is the plain text label for data
READING_TYPES =  {"Wind_Speed" => "Wind Speed", "Air_Temp" => "Air Temp", "Barometric_Press" => " Pressure"}


### User Input Section ###

def query_user_date_range
	
	start_date = nil
	end_date = nil
	
	# Defensive test loop, keep it loop until there are valid start date and end date
	until start_date && end_date
	
		puts "\nFirst, Start Date"
		start_date = query_user_for_date
	
		puts "\nNext, End Date"
		end_date = query_user_for_date
		
		# Defensive test, if date range is not valid, output error
		# set dates to nothing (nil)
		if !date_range_valid?(start_date, end_date)
		 puts "Not valid range! Try again."
		 start_date = end_date = nil
		end # close if
	
	end # close until

	
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
			date = Date.parse(response) # parse => format in YYYY-MM-DD 
		rescue ArgumentError
			puts "\nInvalid date format"
		end # close begin rescue
		
		# set the date is nothing (nil) unless the date is valid
		# defensive test to check a valid date
		date = nil unless date_valid?(date) # similar to => if !date_valid(date)
		
	end # close until
		
	return date
end


# Method: Test if the single date is valid
# Return true if variable date is valid within the range, false otherwise
def date_valid?(date)
	
	# variable valid date only within range of earliest date until today's date
	# data that is retrieved must be after start date and before today
	valid_date = Date.parse(DATA_START_DATE)..Date.today
	
	# Check if the passed argument, date is within the valid date
	if valid_date.cover?(date)
	 return true
	else
	 puts "\nDate must be after #{DATA_START_DATE} and before today, #{Date.today}"
	 return false
	end # close if else
end


# Method: Test if a range of dates is valid
# Always return true for valid, otherwise return false
def date_range_valid?(start_date, end_date)
	if start_date > end_date
	 puts "\nStart date must be before End date"
	 return false
	elsif start_date + MAX_DAYS < end_date
	 # to check if end date is too far in future to retrieve data
	 puts "\nNo more than #{MAX_DAYS} days. Be kind to remote server"
	 return false
	end # close if else
	
	return true
end

### User Input Section End ###


### Retrieve Remote Data Section ###

def get_readings_from_remote_for_dates(type, start_date, end_date)

	readings = []
	
	start_date.upto(end_date) do |date|
		readings += get_readings_from_remote(type, date)
	end # close iterator upto
	return readings

end

### Retrieve Remote Data Section ###
