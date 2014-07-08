# <!-- var locations = ["<%= Listing.last.location %>"]

# for (var y = 0; y < (<%Listing.all.count%>); y++) {
#  -->

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


def final2compare()
  locations = []

  usersearch1 = User.last.requests.last.datein
  usersearch2 = User.last.requests.last.dateout

  jdReqDatein = dateSplitter(usersearch1)
  jdReqDateout = dateSplitter(usersearch2)

  Listing.all.each do |listing|
    jdListDatein = dateSplitter(listing.datein)
    jdListDateout = dateSplitter(listing.dateout)

    if (jdReqDatein >= jdListDatein) && (jdReqDateout <= jdListDateout) && (jdReqDateout>= jdReqDatein)
      locations.push(listing.location)
    end 
  end

  return locations
end 

