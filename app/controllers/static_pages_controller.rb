class StaticPagesController < ApplicationController
  def home
    if lender_signed_in?
		@lender = current_lender
		@lendablemachinery = current_lender.lendablemachineries
		@lendablemachineryadded = current_lender.lendablemachineries.build if lender_signed_in?
	end
  end
 
def updatedistrict_select
  render :partial => "districts_select"
end

# Since "State Select" is not used!
# def updatedistrict_select
  # districts = District.where(:state_cd=>params[:state_cd]).order(:name)
  # render :partial => "districts_select", :locals => { :districts => districts }
# end

def updatetaluk_select
  taluks = Taluk.where(:district_cd=>params[:district_cd]).order(:name)
  render :partial => "taluks_select", :locals => { :taluks => taluks }
end

def updatevillage_select
  villages = Village.where(:taluk_cd=>params[:taluk_cd]).order(:name)
  render :partial => "villages_select", :locals => { :villages => villages }
end

###############
def lndr_updatetaluk_select
  taluks = Taluk.where(:district_cd=>params[:district_cd]).order(:name)
  render :partial => "lndrtaluks_select", :locals => { :taluks => taluks }
end

def lndr_updatevillage_select
  villages = Village.where(:taluk_cd=>params[:taluk_cd]).order(:name)
  render :partial => "lndrvillages_select", :locals => { :villages => villages }
end
##############

def machine_select
  machines = Machinery.where(:machinerycategory_id=>params[:machinerycategory_id]).order(:name)
  render :partial => "machines_select", :locals => { :machines => machines }
end

def check_machine_select
	lender_id=params[:lender_id]
	machinery_id=params[:machinery_id]
	machine = Lendablemachinery.find_by_sql("SELECT * FROM lendablemachineries WHERE lender_id = #{lender_id} AND machinery_id = #{machinery_id}")
	render :partial => "addlmachines_select", :locals => {:machine=>machine}
end

def search_machinery
	category_id=params[:category_id]
	district_cd=params[:district_cd]
	taluk_cd=params[:taluk_cd]
	lendablemachineries=Lendablemachinery.find_by_sql(
		"SELECT LM.lender_id, LM.numofmachines, LM.rateperhr, M.id, M.name mname, M.manufacturer, L.name lname, 
		 L.phone, L.street, L.village_cd, L.taluk_cd, L.district_cd, L.state_cd
		 FROM lendablemachineries LM
		 INNER JOIN machineries M
		 ON M.id = LM.machinery_id AND M.machinerycategory_id = #{category_id} AND LM.numofmachines > 0
		 INNER JOIN lenders L
		 ON L.id = LM.lender_id AND L.district_cd = #{district_cd} AND L.taluk_cd = #{taluk_cd}")
	# dis=''
    # lendablemachineries.each { |m|	# an array of objects!
	 	 # dis=dis+m.mname+', '
	# }

	render :partial => "search_machinery", :locals => {:lendablemachineries=>lendablemachineries}
	
    # respond_to do |format|
		# format.html {render :template => "/static_pages/search_machinery", :locals => {:lendablemachineries=>lendablemachineries}}
		# format.html	{redirect_to(root_path)}
		# format.js
	# end
end

  def help
  end

  def about
  end

  def contact
  end

end
