class ParksSell < ActiveRecord::Base

  self.table_name = :Parks_Sell
  alias_attribute :park_number, :Park_number
  alias_attribute :ticket_number, :Transaction_number

end
