module FarmersessionsHelper

  def farmer_sign_in(farmer)
    cookies.permanent[:remember_token] = farmer.remember_token
    current_farmer = farmer
  end
  
  def farmer_signed_in?
    !current_farmer.nil?
  end
  
  def current_farmer=(farmer)
    @current_farmer = farmer
  end
  
  def current_farmer
    @current_farmer ||= farmer_from_remember_token
  end

  def farmer_sign_out
    cookies.delete(:remember_token)
  end
  
  private

    def farmer_from_remember_token
      remember_token = cookies[:remember_token]
      Farmer.find_by_remember_token(remember_token) unless remember_token.nil?
    end

end
