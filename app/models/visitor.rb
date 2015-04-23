class Visitor < ActiveRecord::Base

  self.table_name = "Visitors"
  alias_attribute "id", "ID"
  alias_attribute "name", "Name"
  alias_attribute "gender", "Gender"
  alias_attribute "birthday", "Birthday"
  self.primary_key = "id"
  
end
