ThinkingSphinx::Index.define :visitor, :with => :active_record do
  indexes :Name, :sortable => true
  indexes :Gender, :sortable => true
  indexes :Birthday, :sortable => true

end