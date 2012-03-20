class LendersessionsController < ApplicationController

  def new
  end

  def create
    lender = Lender.find_by_email(params[:lendersession][:email])
    #  if user && user.authenticate(params[:lendersession][:password])
    if lender
        # Sign the user in and redirect to the user's show page.
	    lender_sign_in lender
        redirect_back_or lender
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
