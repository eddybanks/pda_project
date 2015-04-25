class Visitor < ActiveRecord::Base

	has_many :tickets, :dependent => :delete_all
	has_many :reviews, :dependent => :delete_all

  self.table_name = "Visitors"
  self.primary_key = "ID"
  alias_attribute "id", "ID"
  alias_attribute "name", "Name"
  alias_attribute "gender", "Gender"
  alias_attribute "birthday", "Birthday"

end
