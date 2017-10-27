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

 function getPosition(element){
        var e = document.getElementById(element);
        var left = 0;
        var top = 0;

        do{
            left += e.offsetLeft;
            top += e.offsetTop;
        }while(e = e.offsetParent);

        return [left, top];
}

function clear_search_bar(select_tag){
	document.getElementById('searchfield').value = ''

	// To-do : set the focus to the Company Table after search
	window.scrollTo(getPosition('company-table'));
}

function search_button_click(select_tag){
	// To-do: set the focus to the Company Table after search
	//	window.location.href="#company-table"
	window.scrollTo(getPosition('company-table'));
}

function reset_filters(select_tag){
	document.getElementById('cat_select').value = ''
	document.getElementById('country_select').value = ''
	document.getElementById('state_select').value = ''
	document.getElementById('city_select').value = ''
}