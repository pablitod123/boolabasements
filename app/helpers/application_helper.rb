require 'date'

module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Boola Basements"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end


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

  usersearch1 = current_user.requests.last.datein
  usersearch2 = current_user.requests.last.dateout

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




end