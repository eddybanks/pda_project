class Attraction < ActiveRecord::Base

	# belongs_to :park
	# has_many :reviews
	# has_and_belongs_to_many :transactions, join_table: :attractions_sell

  self.per_page = 10
  self.primary_key = "Number"
  self.table_name = "Attractions"
  alias_attribute "id", "Number"
  alias_attribute "name", "Name"
  alias_attribute "size", "Size"
  alias_attribute "category", "Type"
  alias_attribute "park_number", "Park_number"

end
