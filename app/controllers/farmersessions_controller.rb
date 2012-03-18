class FarmersessionsController < ApplicationController

  def new
  end

  def create
    farmer = Farmer.find_by_phone(params[:farmersession][:phone])
    #  if user && user.authenticate(params[:session][:password])
    if farmer
        # Sign the user in and redirect to the user's show page.
	    farmer_sign_in farmer
        redirect_to farmer
    else
        # Create an error message and re-render the signin form.
	    flash.now[:error] = 'Invalid phone number/password combination'
        render 'new'
    end
  end

  def destroy
    farmer_sign_out
    redirect_to root_path
  end

end
