class Park < ActiveRecord::Base

	has_many :attractions, :dependent => :destroy, :foreign_key => :Park_number
	has_and_belongs_to_many :tickets, :dependent => :destroy, join_table: :Parks_Sell, :foreign_key => :Park_number

  self.table_name = :Parks
  self.primary_key = :Number
  alias_attribute :id, :Number
  alias_attribute :name, :Name
  alias_attribute :size, :Size
  alias_attribute :address,:Address

end
