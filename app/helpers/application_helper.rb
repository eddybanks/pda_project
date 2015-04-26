module ApplicationHelper              # This helper sorts data entries for the columns according to the columns selected via the table headers

  def sortable(column, title = nil)
    title ||= column.titleize                                                         # titleize the column names to be output if a different argument for title isn't inserted
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end

end
