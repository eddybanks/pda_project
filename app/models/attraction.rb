class Attraction < ActiveRecord::Base

  self.table_name = "Attractions"
  alias_attribute "id", "Number"
  alias_attribute "name", "Name"
  alias_attribute "size", "Size"
  alias_attribute "category", "Type"
  alias_attribute "park_number", "Park_number"
  self.primary_key = "id"

end
