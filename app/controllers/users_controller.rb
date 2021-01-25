class UsersController < ApplicationController
  before_action :check_for_admin, :only => [:index]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    #set up a user object
    @user = User.create user_params
    if @user.save
    #if the user can be saved in the database
    session[:user_id] = @user.id
    redirect_to root_path
    #redirect homepage
    else
    #else
    render :new
    #render the new form again
    end
  end

    private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
