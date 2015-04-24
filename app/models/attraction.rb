class Attraction < ActiveRecord::Base

  self.per_page = 10
  self.primary_key = "Number"
  self.table_name = "Attractions"
  alias_attribute "id", "Number"
  alias_attribute "name", "Name"
  alias_attribute "size", "Size"
  alias_attribute "category", "Type"
  alias_attribute "park_number", "Park_number"

end
