class Attraction < ActiveRecord::Base

	# associations in rails can be inferred from the method names. a belongs_to shows a belongs to database E-R association
	belongs_to :park
	has_many :reviews, :dependent => :destroy, :foreign_key => :Attraction_number    # dependent destroy deletes all child tables and is therefore a cascading delete method
	has_and_belongs_to_many :tickets, :dependent => :destroy, join_table: :Attractions_Sell, :foreign_key => :Attraction_number

  self.per_page = 10
  self.primary_key = :Number
  self.table_name = :Attractions			# this refers the class to the table in the mysql database

	# alias_attribute helper methods are used to map the names of the table to their appropriate table names according to rails naming conventions
  alias_attribute :id, :Number
  alias_attribute :name, :Name
  alias_attribute :size, :Size
  alias_attribute :category, :Type
  alias_attribute :park_number, :Park_number

end
