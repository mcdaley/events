#------------------------------------------------------------------------------
# app/models/host.rb
#------------------------------------------------------------------------------
class Host < ActiveRecord::Base
  belongs_to  :organization
  has_many    :events
  
  validates   :name,  presence:   true, length:     { within:   1..255 }
end
