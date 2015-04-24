class Park < ActiveRecord::Base

  self.table_name = "Parks"
  self.primary_key = "Number"
  alias_attribute "id", "Number"
  alias_attribute "name", "Name"
  alias_attribute "size", "Size"
  alias_attribute "address", "Address"

end
