class Review < ActiveRecord::Base

  self.table_name = :Reviews
  self.primary_key = :Number
  alias_attribute :id, :Number
  alias_attribute :comment, :Comment
  alias_attribute :rating, :Rating
  alias_attribute :visitor_id, :Visitor_id
  alias_attribute :attraction_number, :Attraction_number

end
