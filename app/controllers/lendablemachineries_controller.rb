class LendablemachineriesController < ApplicationController
  before_filter :signed_in_lender

  def create
    @lendablemachinery = current_lender.lendablemachineries.build(params[:lendablemachinery])
    if @lendablemachinery.save
      flash[:success] = "Lendable machine added!"
      redirect_to root_path
    else
      render root_path
    end
  end
  
  def edit
  	@lm = Lendablemachinery.find(params[:id])
  end
  
  def update
  	@lm = Lendablemachinery.find(params[:id])
		if @lm.update_attributes(:numofmachines => params[:lendablemachinery][:numofmachines], :rateperhr => params[:lendablemachinery][:rateperhr])
			flash[:success] = "Lendable Machinery details updated!"
			# redirect_to root_path
			redirect_to :controller => 'lenders', :action => 'show', :id => params[:lendablemachinery][:lender_id]
		else
			@title = "Edit lendable machinery"
			render 'edit'
		end
  end
  
  def destroy
  	@lm = Lendablemachinery.find(params[:id])
	@lm.destroy
	flash[:success] = "Lendable machine deleted!"
	redirect_to root_path
  end
end
