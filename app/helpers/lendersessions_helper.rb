module LendersessionsHelper

  def lender_sign_in(lender)
    cookies.permanent[:remember_token] = lender.remember_token
    current_lender = lender
  end
  
  def lender_signed_in?
    !current_lender.nil?
  end
  
  def current_lender=(lender)
    @current_lender = lender
  end
  
  def current_lender
    @current_lender ||= lender_from_remember_token
  end

  def lender_sign_out
    cookies.delete(:remember_token)
  end
  
  private

    def lender_from_remember_token
      remember_token = cookies[:remember_token]
      Lender.find_by_remember_token(remember_token) unless remember_token.nil?
    end

end
