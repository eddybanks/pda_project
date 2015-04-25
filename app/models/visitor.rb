class Visitor < ActiveRecord::Base

	has_many :tickets, :dependent => :destroy, :foreign_key => :Visitor_id
	has_many :reviews, :dependent => :destroy, :foreign_key => :Visitor_id

  self.table_name = :Visitors
  self.primary_key = :ID
  alias_attribute :id, :ID
  alias_attribute :name, :Name
  alias_attribute :gender, :Gender
  alias_attribute :birthday, :Birthday

end
