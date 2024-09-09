class SessionsController < ApplicationController
  before_action :redirect_dashboard_user, only: [:new]

  def new
    @user = User.new
  end

  def create
    # 1- Verifica si existe el email
    @user = User.find_by(email: params['email'])
    if @user
      # 2- Verifica la contraseña
      if @user.authenticate(params['password'])
        session[:current_user] = @user.id
        redirect_to client_memberships_path, notice: "Te haz logeado exitosamente"
      else 
        flash[:alert] = "Password incorrecto"
        render :new, status: :unprocessable_entity
      end
    else 
      render :new, status: :unprocessable_entity, alert: "No existe el email"
    end
  end

  def destroy 
    reset_session
    redirect_to  root_path
  end
  
  private 

  def redirect_dashboard_user
    redirect_to client_memberships_path if user_signed_in? 
  end
end
