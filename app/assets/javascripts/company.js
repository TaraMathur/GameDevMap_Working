function filter_on_country(select_tag){
  countrySelected = $(select_tag).val()
  $.ajax({
    url: "companies/filter_on_country_select",
    data: {countrySelected: countrySelected}
  })
 }

function filter_on_city(select_tag){
  citySelected = $(select_tag).val()
  $.ajax({
    url: "companies/filter_on_city_select",
    data: {citySelected: citySelected}
  })
 }

function filter_on_type(select_tag){
  console.log("in triggerSearch")
  comp_type = $(select_tag).val()
  $.ajax({
    url: "companies/filter_on_selects",
    data: {comp_type: comp_type}
  })
 }

