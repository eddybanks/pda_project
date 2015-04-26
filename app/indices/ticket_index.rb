ThinkingSphinx::Index.define :ticket, :with => :active_record do
  indexes :Date, :sortable => true
  indexes :Type, :sortable => true
  indexes :Price, :sortable => true

end