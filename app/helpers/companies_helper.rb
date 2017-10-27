module CompaniesHelper
	def convert_to_ammaps_json(data_array)
	   data_array.to_json.gsub(/\"text\"/, "text").html_safe
	end
end