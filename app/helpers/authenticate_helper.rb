module AuthenticateHelper

  # Retorna información del usuario actual
  def current_user
    if session[:current_user]
      current_user ||= User.find_by(id: session[:current_user])
    end
  end

  # Retorna boolean si el usuario esta logeado o no
  def user_signed_in? 
    result = false
    if session[:current_user]
      result = true
    end
    
    result
  end

  # Retorna al login o home, dependiendo del estado de session
  def authenticate_user
    if session[:current_user]
      @user = User.find_by(id: session[:current_user])
      if @user
        
      end
    else
      redirect_to users_sign_in_path
    end
  end

end
