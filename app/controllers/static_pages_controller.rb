class StaticPagesController < ApplicationController
  def home
    if lender_signed_in?
		@lender = current_lender
		@lendablemachinery = @lender.lendablemachineries
		@lendablemachineryadded = current_lender.lendablemachineries.build if lender_signed_in?
	end
  end

  def help
  end

  def about
  end

  def contact
  end

end
