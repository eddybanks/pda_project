class Visitor < ActiveRecord::Base

	# associations in rails can be inferred from the method names. a belongs_to shows a belongs to database E-R association
	has_many :tickets, :dependent => :destroy, :foreign_key => :Visitor_id
	has_many :reviews, :dependent => :destroy, :foreign_key => :Visitor_id

  self.table_name = :Visitors			# this refers the class to the table in the mysql database
  self.primary_key = :ID

	# alias_attribute helper methods are used to map the names of the table to their appropriate table names according to rails naming conventions
  alias_attribute :id, :ID
  alias_attribute :name, :Name
  alias_attribute :gender, :Gender
  alias_attribute :birthday, :Birthday

end
