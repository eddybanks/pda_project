class Ticket < ActiveRecord::Base

	belongs_to :visitor
	has_and_belongs_to_many :parks, :dependent => :destroy, join_table: :Parks_Sell, :foreign_key => :Transaction_number
	has_and_belongs_to_many :attractions, :dependent => :destroy, join_table: :Attractions_Sell, :foreign_key => :Transaction_number

  self.table_name = :Transactions
  self.primary_key = :Number
  alias_attribute :id, :Number
  alias_attribute :date, :Date
  alias_attribute :type, :Type
  alias_attribute :price, :Price
  alias_attribute :visitor_id, :Visitor_id

end
