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

def machine_select
  machines = Machinery.where(:machinerycategory_id=>params[:machinerycategory_id]).order(:name)
  render :partial => "machines_select", :locals => { :machines => machines }
end

  def help
  end

  def about
  end

  def contact
  end

end
