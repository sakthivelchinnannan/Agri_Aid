class LendersessionsController < ApplicationController

  def new
  end

  def create
    lender = Lender.find_by_email(params[:lendersession][:email])
    #  if user && user.authenticate(params[:lendersession][:password])
    if lender
        # Sign the user in and redirect to the user's show page.
	    lender_sign_in lender
	  	@lendablemachineryadded = lender.lendablemachineries.build if lender_signed_in?	# Useless as of now. Should be corrected!
		redirect_to lender # Shows the Profile page after sign in.
		# redirect_to root_path # Actually not needed & poses issues with machineries display.
    else
        # Create an error message and re-render the signin form.
	    flash.now[:error] = 'Invalid email/password combination'
        render 'new'
    end
  end

  def destroy
    lender_sign_out
    redirect_to root_path
  end

end
