class LendablemachineriesController < ApplicationController
  before_filter :signed_in_lender

  def create
    @lendablemachinery = current_lender.lendablemachineries.build(params[:lendablemachinery])
    if @lendablemachinery.save
      flash[:success] = "Lendable machine added!"
      redirect_to root_path
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end
end
