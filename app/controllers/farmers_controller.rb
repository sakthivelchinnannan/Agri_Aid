class FarmersController < ApplicationController
  def new
      @farmer=Farmer.new
  end

  def show
      @farmer=Farmer.find(params[:id])
  end

  def create
    @farmer = Farmer.new(params[:farmer])
    if @farmer.save
      farmer_sign_in @farmer
      flash[:success] = "You are registered in Primal Project!"
      redirect_to @farmer
    else
      render 'new'
    end
  end

end
