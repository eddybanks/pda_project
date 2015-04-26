ThinkingSphinx::Index.define :attraction, :with => :active_record do
  indexes :Name, :sortable => true
  indexes :Type, :sortable => true
  indexes :Size, :sortable => true
  # indexes park.name, as: park_name

end