class LendersController < ApplicationController
  def new
      @lender=Lender.new
  end

  def show
      @lender=Lender.find(params[:id])
      @lendablemachinery = @lender.lendablemachineries
  end

  def create
    @lender = Lender.new(params[:lender])
    if @lender.save
      lender_sign_in @lender
      flash[:success] = "You are registered in Primal Project!"
      redirect_to @lender
    else
      render 'new'
    end
  end

end
