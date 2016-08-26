#------------------------------------------------------------------------------
# app/models/organization.rb
#------------------------------------------------------------------------------
class Organization < ActiveRecord::Base
  has_many    :events
  
  validates   :name,    presence:   true,
                        length:     { within:   1..255 }
                            
  validates   :domain,  presence:   true,
                        length:     { within:   1..255 }                            
end
