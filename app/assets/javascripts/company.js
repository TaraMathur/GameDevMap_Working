function change_states(select_tag){
  value1 = $(select_tag).val()
  $.ajax({
    url: "companies/update_stateprovs",
    data: {data1: value1}
  })
 }