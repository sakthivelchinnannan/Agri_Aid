[1mdiff --git a/app/assets/images/276.gif b/app/assets/images/276.gif[m
[1mdeleted file mode 100644[m
[1mindex de68fd7..0000000[m
Binary files a/app/assets/images/276.gif and /dev/null differ
[1mdiff --git a/app/assets/images/loadingcircle1.gif b/app/assets/images/loadingcircle1.gif[m
[1mdeleted file mode 100644[m
[1mindex d40f75f..0000000[m
Binary files a/app/assets/images/loadingcircle1.gif and /dev/null differ
[1mdiff --git a/app/assets/javascripts/application.js b/app/assets/javascripts/application.js[m
[1mindex 5ded95a..eadd6d3 100644[m
[1m--- a/app/assets/javascripts/application.js[m
[1m+++ b/app/assets/javascripts/application.js[m
[36m@@ -11,7 +11,8 @@[m
 jQuery(function($) {[m
 [m
 $("#category_id").change(function(){[m
[31m-  $("#districtSelect").html('<img src="assets/276.gif" alt="Fetching..." width="100px" height="30px" />')[m
[32m+[m[32m//  $("#districtSelect").html('<img src="assets/365.gif" alt="Fetching..." width="100px" height="30px" />')[m
[32m+[m[32m  $("#districtSelect").html('<img src="assets/365.gif" alt="Fetching..." />')[m
   var url = '/static_pages/updatedistrict_select?machinerycategory_id=' + $(this).val()[m
   jQuery.get(url, function(data) {[m
 	$("#districtSelect").html(data);[m
[36m@@ -20,7 +21,7 @@[m [m$("#category_id").change(function(){[m
 });[m
 [m
 $("#machinerycategory_id").change(function(){[m
[31m-  $("#machineSelect").html('<img src="assets/276.gif" alt="Fetching..." width="100px" height="30px" />')[m
[32m+[m[32m  $("#machineSelect").html('<img src="assets/365.gif" alt="Fetching..." />')[m
   var url = '/static_pages/machine_select?machinerycategory_id=' + $(this).val()[m
   jQuery.get(url, function(data) {[m
 	$("#machineSelect").html(data);[m
[36m@@ -28,4 +29,12 @@[m [m$("#machinerycategory_id").change(function(){[m
   return false;[m
 });[m
 [m
[32m+[m[32m$("#lendablemachinery_machinery_id").change(function(){[m
[32m+[m[32m  var url = '/static_pages/add_lmachine_select?machinery_id=' + $(this).val()[m
[32m+[m[32m  jQuery.get(url, function(data) {[m
[32m+[m	[32m$("#lmcadderror").html(data);[m
[32m+[m[32m  });[m
[32m+[m[32m  return false;[m
[32m+[m[32m});[m
[32m+[m
 })[m
\ No newline at end of file[m
[1mdiff --git a/app/controllers/static_pages_controller.rb b/app/controllers/static_pages_controller.rb[m
[1mindex f509c80..4c8947e 100644[m
[1m--- a/app/controllers/static_pages_controller.rb[m
[1m+++ b/app/controllers/static_pages_controller.rb[m
[36m@@ -32,6 +32,11 @@[m [mdef machine_select[m
   render :partial => "machines_select", :locals => { :machines => machines }[m
 end[m
 [m
[32m+[m[32mdef add_lmachine_select[m
[32m+[m[32m  machines = Lendablemachinery.where("lender_id = ? AND machinery_id = ?", 6, params[:machinery_id])[m
[32m+[m[32m  render :partial => "addlmachines_select", :locals => { :machines => machines }[m
[32m+[m[32mend[m
[32m+[m
 def search_machinery[m
 	category_id=params[:category_id][m
 	district_cd=params[:district_cd][m
[1mdiff --git a/app/views/shared/_lendablemachinery_form.html.erb b/app/views/shared/_lendablemachinery_form.html.erb[m
[1mindex f172312..64528d8 100644[m
[1m--- a/app/views/shared/_lendablemachinery_form.html.erb[m
[1m+++ b/app/views/shared/_lendablemachinery_form.html.erb[m
[36m@@ -1,8 +1,8 @@[m
 <%= form_for(@lendablemachineryadded) do |f| %>[m
   <%= render 'shared/lender_error_messages', object: f.object %>[m
   <div class="field">[m
[31m-    <%= f.label :select_machinery_category %><br />[m
[31m-	<%= select_tag(:machinerycategory_id, options_for_select(Machinerycategory.all.map {|m|[m.name,m.id]})) %>[m
[32m+[m[32m    <%= label_tag(:machinery_category) %><br />[m[41m[m
[32m+[m	[32m<%= select_tag(:machinerycategory_id, options_for_select(Machinerycategory.all.map {|m|[m.name,m.id]}.insert(0,'Select a category..'))) %>[m[41m[m
   </div>[m
   <div id="machineSelect">[m
   </div></br>[m
[1mdiff --git a/app/views/static_pages/_districts_select.html.erb b/app/views/static_pages/_districts_select.html.erb[m
[1mindex 3bd64cb..b9937fb 100644[m
[1m--- a/app/views/static_pages/_districts_select.html.erb[m
[1m+++ b/app/views/static_pages/_districts_select.html.erb[m
[36m@@ -1,7 +1,7 @@[m
 <script type="text/javascript">[m
 jQuery(function($) {[m
 $("#district_cd").change(function(){[m
[31m-  $("#talukSelect").html('<img src="assets/276.gif" alt="Fetching..." width="100px" height="30px" />')[m
[32m+[m[32m  $("#talukSelect").html('<img src="assets/365.gif" alt="Fetching..." />')[m[41m[m
   var url = '/static_pages/updatetaluk_select?district_cd=' + $(this).val()[m
   jQuery.get(url, function(data) {[m
 	$("#talukSelect").html(data);[m
[1mdiff --git a/app/views/static_pages/_machines_select.html.erb b/app/views/static_pages/_machines_select.html.erb[m
[1mindex ddb34a7..c33cd31 100644[m
[1m--- a/app/views/static_pages/_machines_select.html.erb[m
[1m+++ b/app/views/static_pages/_machines_select.html.erb[m
[36m@@ -1 +1,13 @@[m
[31m-<%= select(:lendablemachinery, :machinery_id, options_for_select(machines.collect {|m|[m.name,m.id]}.insert(0,'Select a machinery..'))) %>[m
\ No newline at end of file[m
[32m+[m[32m<script type="text/javascript">[m[41m[m
[32m+[m[32mjQuery(function($) {[m[41m[m
[32m+[m[32m$("#machinery_id").change(function(){[m[41m[m
[32m+[m[32m  var url = '/static_pages/add_lmachine_select?machinery_id=' + $(this).val()[m[41m[m
[32m+[m[32m  jQuery.get(url, function(data) {[m[41m[m
[32m+[m	[32m$("#remainingform").html(data);[m[41m[m
[32m+[m[32m  });[m[41m[m
[32m+[m[32m  return false;[m[41m[m
[32m+[m[32m});[m[41m[m
[32m+[m[32m})[m[41m[m
[32m+[m[32m</script>[m[41m[m
[32m+[m[41m[m
[32m+[m[32m<%= select(:machinery_id, options_for_select(machines.collect {|m|[m.name,m.id]}.insert(0,'Select a machinery..'))) %>[m[41m[m
[1mdiff --git a/app/views/static_pages/_taluks_select.html.erb b/app/views/static_pages/_taluks_select.html.erb[m
[1mindex d5afabb..b838604 100644[m
[1m--- a/app/views/static_pages/_taluks_select.html.erb[m
[1m+++ b/app/views/static_pages/_taluks_select.html.erb[m
[36m@@ -1,7 +1,7 @@[m
 <script type="text/javascript">[m
 jQuery(function($) {[m
 $("#taluk_cd").change(function(){[m
[31m-  $("#villageSelect").html('<img src="assets/276.gif" alt="Fetching..." width="100px" height="30px" />')[m
[32m+[m[32m  $("#villageSelect").html('<img src="assets/365.gif" alt="Fetching..." />')[m[41m[m
   var url = '/static_pages/updatevillage_select?taluk_cd=' + $(this).val()[m
   jQuery.get(url, function(data) {[m
 	$("#villageSelect").html(data);[m
[1mdiff --git a/app/views/static_pages/_villages_select.html.erb b/app/views/static_pages/_villages_select.html.erb[m
[1mindex c0f9575..99cd707 100644[m
[1m--- a/app/views/static_pages/_villages_select.html.erb[m
[1m+++ b/app/views/static_pages/_villages_select.html.erb[m
[36m@@ -6,7 +6,7 @@[m [m$("#mcsearchsubmit").click(function(){[m
   }[m
   else {[m
       $("#mcsearcherror").html('<p></p>')[m
[31m-	  $("#machinerydetails").html('<img src="assets/276.gif" alt="Fetching..." width="100px" height="30px" />')[m
[32m+[m	[32m  $("#machinerydetails").html('<img src="assets/365.gif" alt="Fetching..." />')[m[41m[m
 	  var url = '/static_pages/search_machinery?category_id=' + $("#category_id").val() + '&district_cd=' + $("#district_cd").val() + '&taluk_cd=' + $("#taluk_cd").val()[m
 	  jQuery.get(url, function(data) {[m
 		$("#machinerydetails").html(data);[m
[1mdiff --git a/config/routes.rb b/config/routes.rb[m
[1mindex 7c04cf9..0d7daa5 100644[m
[1m--- a/config/routes.rb[m
[1m+++ b/config/routes.rb[m
[36m@@ -23,6 +23,7 @@[m [mAgriAid::Application.routes.draw do[m
   match 'static_pages/updatevillage_select/', :controller => 'static_pages', :action => 'updatevillage_select'[m
   match 'static_pages/machine_select/', :controller => 'static_pages', :action => 'machine_select'[m
   match 'static_pages/search_machinery/', :controller => 'static_pages', :action => 'search_machinery'[m
[32m+[m[32m  match 'static_pages/add_lmachine_select/', :controller => 'static_pages', :action => 'add_lmachine_select'[m
 [m
   # The priority is based upon order of creation:[m
   # first created -> highest priority.[m
