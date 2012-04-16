// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

jQuery(function($) {

$("#category_id").change(function(){
  $("#districtSelect").html('<img src="assets/276.gif" alt="Fetching..." width="100px" height="30px" />')
  var url = '/static_pages/updatedistrict_select?machinerycategory_id=' + $(this).val()
  jQuery.get(url, function(data) {
	$("#districtSelect").html(data);
  });
  return false;
});

$("#machinerycategory_id").change(function(){
  $("#machineSelect").html('<img src="assets/276.gif" alt="Fetching..." width="100px" height="30px" />')
  var url = '/static_pages/machine_select?machinerycategory_id=' + $(this).val()
  jQuery.get(url, function(data) {
	$("#machineSelect").html(data);
  });
  return false;
});

})