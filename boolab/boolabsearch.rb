# Retrieves user request from database
# converts it to jd
# Compares user request dates to all listings for matches
# stores matches in array and puts them into the view. 
require 'date'

def dateSplitter(userinput)
  eventDate = userinput.split('/')
  eventMonth = eventDate[0]
  eventDay = eventDate[1]
  eventYear = eventDate[2]
  dateTimeObj = dtoconverter(eventYear.to_i, eventMonth.to_i, eventDay.to_i)
  finaldate = dateTimeObj.jd
  return finaldate
end

def dtoconverter(year,month,day)
    newtime = DateTime.new(year,month,day)
    return newtime
end

@searchIds = []

def finalcompare()
usersearch1 = "07/18/2014"
usersearch2 = "07/20/2014"
# current_user.requests.last.datein
# current_user.requests.last.dateout

jdReqDatein = dateSplitter(usersearch1)
jdReqDateout = dateSplitter(usersearch2)

Listing.all.each do |listing|
jdListDatein = dateSplitter(listing.datein)
jdListDateout = dateSplitter(listing.dateout)
		if jdReqDatein <= jdListDateout && jdListDatein <= jdReqDateout
		@searchIds.push(listing.id)
		end 
	end 
  return @searchIds
end 








