#  lake_readings.rb
#  
#  Copyright 2016 muhammad <muhammad@muhammad-ThinkPad-T420>
#  
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#  
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#  MA 02110-1301, USA.
#  
#
#!/usr/bin/env ruby

require_relative('functions')

puts "\n*** LAKE PEND OREILLE READINGS *** "
puts "Calculates the mean and median of the wind speed, air temperature,"
puts "and barometric pressure recorded at the Deep Moor station"
puts "on Lake Pend Oreille for a given range of dates."

# Intialise variables for dates, Start Date and End Date
# Call a function called Query Date Range for user prompt
start_date, end_date = query_user_date_range

# Output date formats for Start Date and End Date
puts start_date.strftime('%B %d, %Y')
puts end_date.strftime('%B %d, %Y')
