ThinkingSphinx::Index.define :review, :with => :active_record do
  indexes :Comment, :sortable => true
  indexes :Rating, :sortable => true
  indexes :Visitor_id
  indexes :Attraction_number

end