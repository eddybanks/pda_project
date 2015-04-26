class Ticket < ActiveRecord::Base

	# associations in rails can be inferred from the method names. a belongs_to shows a belongs to database E-R association
	belongs_to :visitor
	has_and_belongs_to_many :parks, :dependent => :destroy, join_table: :Parks_Sell, :foreign_key => :Transaction_number
	has_and_belongs_to_many :attractions, :dependent => :destroy, join_table: :Attractions_Sell, :foreign_key => :Transaction_number

  self.table_name = :Transactions			# this refers the class to the table in the mysql database
  self.primary_key = :Number

	# alias_attribute helper methods are used to map the names of the table to their appropriate table names according to rails naming conventions
  alias_attribute :id, :Number
  alias_attribute :date, :Date
  alias_attribute :type, :Type
  alias_attribute :price, :Price
  alias_attribute :visitor_id, :Visitor_id

end
