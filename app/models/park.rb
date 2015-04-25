class Park < ActiveRecord::Base

	has_many :attractions, :dependent => :delete_all
	has_and_belongs_to_many :tickets, :dependent => :delete_all, join_table: :parks_sell

  self.table_name = "Parks"
  self.primary_key = "Number"
  alias_attribute "id", "Number"
  alias_attribute "name", "Name"
  alias_attribute "size", "Size"
  alias_attribute "address", "Address"

end
