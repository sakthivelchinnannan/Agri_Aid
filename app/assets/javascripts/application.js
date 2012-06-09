// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .
//= require jquery.ui.core
//= require jquery.ui.widget
//= require jquery.ui.dialog

jQuery(function($) {
  		$( "#dialog-modal" ).dialog({
  		    autoOpen: false,
			height: 100,
			modal: true,
			draggable: false,
			closeOnEscape: false,
			resizable: false
		});

$("#category_id").change(function(){
  $( "#dialog-modal" ).dialog( "open" );
  var url = '/static_pages/updatedistrict_select?machinerycategory_id=' + $(this).val()
  jQuery.get(url, function(data) {
	$("#districtSelect").html(data);
	$( "#dialog-modal" ).dialog("close");
  });
  return false;
});

$("#machinerycategory_id").change(function(){
  $( "#dialog-modal" ).dialog( "open" );
  var url = '/static_pages/machine_select?machinerycategory_id=' + $(this).val()
  jQuery.get(url, function(data) {
	$("#machineSelect").html(data);
	$( "#dialog-modal" ).dialog("close");
  });
  return false;
});

$("#district_cd").change(function(){
  $("#talukSelect").html('<img src="assets/366.gif" alt="Fetching..." />')
  var url = '/static_pages/updatetaluk_select?district_cd=' + $(this).val()
  jQuery.get(url, function(data) {
	$("#talukSelect").html(data);
  });
  return false;
});

//////////////
$("#lender_district_cd").change(function(){
  $( "#dialog-modal" ).dialog( "open" );
  var url = '/static_pages/lndr_updatetaluk_select?district_cd=' + $(this).val()
  jQuery.get(url, function(data) {
	$("#talukSelect").html(data);
	$( "#dialog-modal" ).dialog("close");
  });
  return false;
});
//////////////

})