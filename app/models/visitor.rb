class Visitor < ActiveRecord::Base

	has_many :tickets
	has_many :reviews

  self.table_name = "Visitors"
  self.primary_key = "ID"
  alias_attribute "id", "ID"
  alias_attribute "name", "Name"
  alias_attribute "gender", "Gender"
  alias_attribute "birthday", "Birthday"

end
