class Review < ActiveRecord::Base

	# associations in rails can be inferred from the method names. a belongs_to shows a belongs to database E-R association
	belongs_to :attraction
	belongs_to :visitor

  self.table_name = :Reviews			# this refers the class to the table in the mysql database
  self.primary_key = :Number

	# alias_attribute helper methods are used to map the names of the table to their appropriate table names according to rails naming conventions
  alias_attribute :id, :Number
  alias_attribute :comment, :Comment
  alias_attribute :rating, :Rating
  alias_attribute :visitor_id, :Visitor_id
  alias_attribute :attraction_number, :Attraction_number

end
