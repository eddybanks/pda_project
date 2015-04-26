class ParksSell < ActiveRecord::Base

	# associations in rails can be inferred from the method names. a belongs_to shows a belongs to database E-R association
  self.table_name = :Parks_Sell			# this refers the class to the table in the mysql database

	# alias_attribute helper methods are used to map the names of the table to their appropriate table names according to rails naming conventions
  alias_attribute :park_number, :Park_number
  alias_attribute :ticket_number, :Transaction_number

end
