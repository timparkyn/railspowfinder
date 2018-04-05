class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    get_forecast(@user.stations)
  end


  def new
    @user = User.new
  end


  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "fuckyeah"
      redirect_to @user
    else
      render 'new'
    end
  end


  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Info updated."
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:danger] = "User deleted"
    redirect_to users_url
  end





  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end




end
