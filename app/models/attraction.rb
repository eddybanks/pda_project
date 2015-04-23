class Attraction < ActiveRecord::Base
  self.table_name = "Attractions"
  self.primary_key = "Number"

  alias_attribute "number", "Number"
  alias_attribute "name", "Name"
  alias_attribute "size", "Size"
  alias_attribute "type", "Type"
  alias_attribute "park_number", "Park_number"
end
