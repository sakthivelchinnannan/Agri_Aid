class StaticPagesController < ApplicationController
  def home
    if lender_signed_in?
		@lender = current_lender
		@lendablemachinery = current_lender.lendablemachineries
		@lendablemachineryadded = current_lender.lendablemachineries.build if lender_signed_in?
	end
  end

#def get_drop_down_options
def machine_select
  val = params[:machinerycategory_id]
  machines = Machinery.where(:machinerycategory_id=>params[:machinerycategory_id]).order(:name)
  render :partial => "machines_select", :locals => { :machines => machines }

  #states = Region.where(:country_id=>params[:id]).order(:name) unless params[:id].blank?
  #render :partial => "states", :locals => { :states => states }

  #Use val to find records	#V2.0 not exactly understood!
  #@array=Machinery.find_by_machinerycategory_id(val)
  #options = Machinery.all.collect{|x| "'#{x.id}' : '#{x.label}'"}    
  #render :text => "{#{options.join(",")}}" 
end

  def help
  end

  def about
  end

  def contact
  end

end
