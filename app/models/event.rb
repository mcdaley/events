#------------------------------------------------------------------------------
# app/models/event.rb
#------------------------------------------------------------------------------
class Event < ActiveRecord::Base
  belongs_to  :organization
  
  validates   :hostname,        presence:   true,
                                length:     { within:   1..255 }
                        
  validates   :message,         presence:   true,
                                length:     { within:   1..255 }

  validates   :timestamp,       presence:   true
  validates   :organization_id, presence:   true
                        
end
