class Admin::UsersController < ApplicationController

  def index
    @users = User.all
  end 

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_users_path, notice: "Se ha creado con éxito"
    else
      render :new
    end
    
  end

  def edit
    @user = User.find(params[:id])
  end

  def update 
    @user = User.find(params[:id])
  end

  # metodo para permitir que atributos pueden ser accedidos
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
