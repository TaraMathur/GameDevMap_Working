function change_states(select_tag){
  countrySelected = $(select_tag).val()
  $.ajax({
    url: "companies/filter_on_country_select",
    data: {countrySelected: countrySelected}
  })
 }

function triggerSearch(select_tag){
  console.log("in triggerSearch")
  comp_type = $(select_tag).val()
  $.ajax({
    url: "companies/filter_on_selects",
    data: {comp_type: comp_type}
  })
 }

function register_filters(){
 $('select#preferences').change( function() {
    $.get('preferences/tag_with',{term: $('option:selected',this).val()});
  });
}
