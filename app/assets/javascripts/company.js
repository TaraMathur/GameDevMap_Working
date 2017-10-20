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
