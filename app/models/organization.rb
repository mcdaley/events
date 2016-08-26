#------------------------------------------------------------------------------
# app/models/organization.rb
#------------------------------------------------------------------------------
class Organization < ActiveRecord::Base
  has_many    :hosts
  
  validates   :name,    presence:   true,
                        length:     { within:   1..255 }
                            
  validates   :domain,  presence:   true,
                        length:     { within:   1..255 }
                        
  #
  # Scopes
  #                           
  def self.events(hostname = nil)
    return self.events      if hostname.nil?
    return self.host.events 
  end
  
  #
  # Public interface
  #
  def hostname(hostname)
    return self.hosts.where(name: hostname)[0]
  end
  
end
