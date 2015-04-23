class Transaction < ActiveRecord::Base

  self.table_name = "Transactions"
  alias_attribute "id", "Number"
  alias_attribute "date", "Date"
  alias_attribute "type", "Type"
  alias_attribute "price", "Price"
  alias_attribute "visitor_id", "Visitor_id"
  self.primary_key = "id"

end
