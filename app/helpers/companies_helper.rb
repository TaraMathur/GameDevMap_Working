module CompaniesHelper
def convert_to_ammaps_json(data_array)
   # tweak this
   data_array.to_json.gsub(/\"text\"/, "text").html_safe
end

def show_me_contents(data_array)
	puts data_array

	data_array.each do |point|
		data_array.name
	end
end

def fillLatLongArray(data_array)

  	latlong = {}
	data_array.each do |element|
		latlong[element.name] = {"latitude": element.latitude, "longitude": element.longitude}
	end

	return latlong
end

def fillMapDataArray(data_array)

	mapData = {}
	i = 0

	data_array.each do |element|
		mapData[i] = {"code": element.name, "name": element.name, "value": 32358260, "color":"#e74c3c"}
		i = i + 1
	end

	return mapData
end

end