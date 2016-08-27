#------------------------------------------------------------------------------
# db/seeds.db
#------------------------------------------------------------------------------

##
# Load the example organizations
#
def load_organizations
  Organization.delete_all
  
  organizations = [
    { id: 1, name: "One",   domain: "one.com" },
    { id: 2, name: "Two",   domain: "two.com" },
    { id: 3, name: "Three", domain: "three.com" },
  ]
  
  i = 0
  organizations.each do |record|
    organization = Organization.new do |org|
      org.id      = record[:id]
      org.name    = record[:name]
      org.domain  = record[:domain]
      i           = i + 1 if org.save
    end
  end
  
  puts "    Loaded #{i} records into Organizations DB table"
end

##
# Load the example hosts
#
def load_hosts
  Host.delete_all
  
  hosts = [
    { id: 1, organization_id: 1, name: "elephant" },
    { id: 2, organization_id: 1, name: "giraffe"  },
    { id: 3, organization_id: 1, name: "gorilla"  },
    { id: 4, organization_id: 2, name: "shark"    },
    { id: 5, organization_id: 2, name: "tuna"     },
    { id: 6, organization_id: 3, name: "kangaroo" },
  ]
  
  i = 0
  hosts.each do |record|
    host = Host.new do |h|
      h.id              = record[:id]
      h.name            = record[:name]
      h.organization_id = record[:organization_id]
      i                 = i + 1 if h.save
    end
  end
  
  puts "    Loaded #{i} records into Hosts DB table"
end

##
# Load the example events
#
def load_events
  Event.delete_all
  
  events = [
    { id:  1, host_id: 1, message: "1st  event", timestamp: 14.day.ago,  },
    { id:  2, host_id: 2, message: "2nd  event", timestamp: 13.day.ago,  },
    { id:  3, host_id: 2, message: "3rd  event", timestamp: 12.day.ago,  },
    { id:  4, host_id: 3, message: "4th  event", timestamp: 11.day.ago,  },
    { id:  5, host_id: 3, message: "5th  event", timestamp: 10.day.ago,  },
    { id:  6, host_id: 3, message: "6th  event", timestamp:  1.day.ago,  },
    { id:  7, host_id: 4, message: "7th  event", timestamp:  2.day.ago,  },
    { id:  8, host_id: 5, message: "8th  event", timestamp:  3.day.ago,  },
    { id:  9, host_id: 5, message: "9th  event", timestamp:  4.day.ago,  },
    { id: 10, host_id: 6, message: "10th event", timestamp:  5.day.ago,  },
    { id: 11, host_id: 6, message: "11th event", timestamp:  9.day.ago,  },
    { id: 12, host_id: 6, message: "12th event", timestamp:  8.day.ago,  },
    { id: 13, host_id: 6, message: "13th event", timestamp:  7.day.ago,  },
    { id: 14, host_id: 6, message: "14th event", timestamp:  6.day.ago,  },
  ]
  
  i = 0
  events.each do |record|
    event = Event.new do |e|
      e.id        = record[:id]
      e.message   = record[:message]
      e.timestamp = record[:timestamp]
      e.host_id   = record[:host_id]
      i           = i + 1 if e.save
    end
  end
  
  puts "    Loaded #{i} records into Hosts DB table"
end

#------------------------------------------------------------------------------
# main
#------------------------------------------------------------------------------
puts "\nINFO: Running db/seeds.rb to load example data"

load_organizations
load_hosts
load_events