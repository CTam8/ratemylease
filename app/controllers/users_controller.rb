class UsersController < ApplicationController

  def index
      @users = User.paginate(page: params[:page])
  end

  def show
    @users = User.find(params[:id])
    render :layout => "profileLayout"
  end

  private

  def user_params
      params.require(:users).permit(:email, :password, :password_confirmation, :created_at, :updated_at,
       :firstname, :lastname, :typeofuser)
  end

  def edit
    @users = User.find(params[:id])
  end

  def new
    @users = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to Rate My Lease"
      redirect_to @user
    else
      render 'new'
    end

  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
end
