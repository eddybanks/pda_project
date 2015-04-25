class Ticket < ActiveRecord::Base

	belongs_to :visitor
	has_and_belongs_to_many :parks, :dependent => :delete_all, join_table: :parks_sell
	has_and_belongs_to_many :attractions, :dependent => :delete_all, join_table: :attractions_sell

  self.table_name = "Transactions"
  self.primary_key = "Number"
  alias_attribute "id", "Number"
  alias_attribute "date", "Date"
  alias_attribute "type", "Type"
  alias_attribute "price", "Price"
  alias_attribute "visitor_id", "Visitor_id"

end
, :dependent => :delete_all
