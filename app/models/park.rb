class Park < ActiveRecord::Base

	# associations in rails can be inferred from the method names. a belongs_to shows a belongs to database E-R association
	has_many :attractions, :dependent => :destroy, :foreign_key => :Park_number
	has_and_belongs_to_many :tickets, :dependent => :destroy, join_table: :Parks_Sell, :foreign_key => :Park_number

  self.table_name = :Parks			# this refers the class to the table in the mysql database
  self.primary_key = :Number

	# alias_attribute helper methods are used to map the names of the table to their appropriate table names according to rails naming conventions
  alias_attribute :id, :Number
  alias_attribute :name, :Name
  alias_attribute :size, :Size
  alias_attribute :address,:Address

end
