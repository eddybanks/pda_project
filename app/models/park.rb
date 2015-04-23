class Park < ActiveRecord::Base

  self.table_name = "Parks"
  alias_attribute "id", "Number"
  alias_attribute "name", "Name"
  alias_attribute "size", "Size"
  alias_attribute "address", "Address"
  self.primary_key = "id"
  
end
