class Transaction < ActiveRecord::Base
  self.table_name = "Transactions"
  self.primary_key = "Number"

  alias_attribute "number", "Number"
  alias_attribute "date", "Date"
  alias_attribute "type", "Type"
  alias_attribute "price", "Price"
  alias_attribute "visitor_id", "Visitor_id"
end
