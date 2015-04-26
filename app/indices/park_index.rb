ThinkingSphinx::Index.define :park, :with => :active_record do
  indexes :Name, :sortable => true
  indexes :Size, :sortable => true
  indexes :Address, :sortable => true

end