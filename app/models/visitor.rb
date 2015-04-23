class Visitor < ActiveRecord::Base
  self.table_name = "Visitors"
  self.primary_key = "ID"

  alias_attribute "number", "ID"
  alias_attribute "name", "Name"
  alias_attribute "gender", "Gender"
  alias_attribute "birthday", "Birthday"
end
