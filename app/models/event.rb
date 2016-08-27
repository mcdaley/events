#------------------------------------------------------------------------------
# app/models/event.rb
#------------------------------------------------------------------------------
class Event < ActiveRecord::Base
  belongs_to  :host
  
                        
  validates   :message,     presence:   true,
                            length:     { within:   1..255 }

  validates   :timestamp,   presence:   true
  
  #----------------------------------------------------------------------------
  # Scopes
  #----------------------------------------------------------------------------
  
  ##
  # Return all of the events for a single host
  #
  # ==== Attributes
  # * +host+ - The host that we're trying to find events
  # * +n+    - Number of events to return, default is 10
  # * +sort+ - Sort order for timestamp, default is descending
  #
  # ==== Usage
  # host   = Host.find(1)
  # events = Event.events_by_host(host)
  #
  # ev     = Event.events_by_host(host, 5, :asc)
  #
  def self.events_by_host(host, n = 10, sort = :desc)
    joins(:host).where(host: host).order(timestamp: sort).limit(n)
  end
  
  ##
  # Return all of the events for an organization
  #
  def self.events_by_org(org, n = 10, sort = :desc)
    joins(host: [:organization]).where('organizations.id = ?', org.id)
                                .order(timestamp: sort)
                                .limit(n)
  end
  
end
