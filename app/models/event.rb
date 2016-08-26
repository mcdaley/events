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
  # * +sort+ - Sort order for timestamp, default is descending
  #
  # ==== Usage
  # host   = Host.find(1)
  # events = Event.events_by_host(host)
  #
  def self.events_by_host(host, sort = :desc)
    joins(:host).where(host: host).order(timestamp: sort)
  end
  
  ##
  # Return all of the events for an organization
  #
  def self.events_by_org(org, sort = :desc)
    joins(host: [:organization]).where('organizations.id = ?', org.id).order(timestamp: sort)
  end
  
end
