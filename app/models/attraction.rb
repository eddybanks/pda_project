class Attraction < ActiveRecord::Base

	belongs_to :park
	has_many :reviews, :dependent => :destroy, :foreign_key => :Attraction_number
	has_and_belongs_to_many :tickets, :dependent => :destroy, join_table: :Attractions_Sell, :foreign_key => :Attraction_number

  self.per_page = 10
  self.primary_key = :Number
  self.table_name = :Attractions
  alias_attribute :id, :Number
  alias_attribute :name, :Name
  alias_attribute :size, :Size
  alias_attribute :category, :Type
  alias_attribute :park_number, :Park_number

end
