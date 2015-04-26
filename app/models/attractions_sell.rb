class AttractionsSell < ActiveRecord::Base

  self.table_name = :Attractions_Sell			# this refers the class to the table in the mysql database

	# alias_attribute helper methods are used to map the names of the table to their appropriate table names according to rails naming conventions
  alias_attribute :attraction_number, :Attraction_number
  alias_attribute :ticket_number, :Transaction_number

end
