class AttractionsSell < ActiveRecord::Base

  self.table_name = :Attractions_Sell
  alias_attribute :attraction_number, :Attraction_number
  alias_attribute :ticket_number, :Transaction_number

end
