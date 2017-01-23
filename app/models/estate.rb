class Estate < ApplicationRecord
    geocoded_by :address   # can also be an IP address
    after_validation :geocode, :if => lambda{ |obj| obj.address_changed? } 
end
