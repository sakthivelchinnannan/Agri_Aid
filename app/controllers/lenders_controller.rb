class LendersController < ApplicationController
  before_filter :signed_in_lender, only: [:edit, :update]
  before_filter :correct_lender,   only: [:edit, :update]
  
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

  def edit
      @lender = Lender.find(params[:id])
  end
  
  def update
    if @lender.update_attributes(params[:lender])
      flash[:success] = "Profile updated"
      lender_sign_in @lender
      redirect_to @lender
    else
      render 'edit'
    end
  end

  private

    def correct_lender
      @lender = Lender.find(params[:id])
      redirect_to(root_path) unless current_lender?(@lender)
    end

end
