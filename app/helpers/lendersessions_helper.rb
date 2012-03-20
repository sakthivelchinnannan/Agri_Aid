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
  
  def current_lender?(lender)
    lender == current_lender
  end

  def lender_sign_out
    cookies.delete(:remember_token)
  end

  def signed_in_lender
    unless lender_signed_in?
      store_location
      redirect_to lendersignin_path, notice: "Please sign in."
    end
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    clear_return_to
  end

  def store_location
    session[:return_to] = request.fullpath
  end
  
  private

    def lender_from_remember_token
      remember_token = cookies[:remember_token]
      Lender.find_by_remember_token(remember_token) unless remember_token.nil?
    end

    def clear_return_to
      session.delete(:return_to)
    end

end
