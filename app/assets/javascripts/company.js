function filter_on_country(select_tag){
  countrySelected = $(select_tag).val()
  $.ajax({
    url: "companies/filter",
    data: {countrySelected: countrySelected}
  })
 }

function filter_on_city(select_tag){
  citySelected = $(select_tag).val()
  $.ajax({
    url: "companies/filter",
    data: {citySelected: citySelected}
  })
 }

function filter_on_type(select_tag){
  comp_type = $(select_tag).val()
  $.ajax({
    url: "companies/filter",
    data: {comp_type: comp_type}
  })
 }

function clear_search_bar(select_tag){
	document.getElementById('searchfield').value = ''
//	window.location.href="#company-table"
}

function search_button_click(select_tag){
//	window.location.href="#company-table"
}

function reset_filters(select_tag){
	document.getElementById('cat_select').value = ''
	document.getElementById('country_select').value = ''
	document.getElementById('state_select').value = ''
	document.getElementById('city_select').value = ''
}