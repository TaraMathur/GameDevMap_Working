module CompaniesHelper
def convert_to_ammaps_json(data_array)
   data_array.to_json.gsub(/\"text\"/, "text").html_safe
end

# This is for making the columns sortable but it isn't hooked up yet
def sort_link(column, title = nil)
    title ||= column.titleize
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    icon = sort_direction == "asc" ? "glyphicon glyphicon-chevron-up" : "glyphicon glyphicon-chevron-down"
    icon = column == sort_column ? icon : ""
    link_to "#{title} <span class='#{icon}'></span>".html_safe, {column: column, direction: direction}
  end
end
