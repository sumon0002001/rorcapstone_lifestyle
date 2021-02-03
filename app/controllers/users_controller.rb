class UsersController < ApplicationController

    def index
        @users = User.all.order(:name)
    end

     def new 
        @user = User.new
    end

    def create 
        @user = User.new(user_params)

        if @user.save
          session[:current_user] = @user
          redirect_to user_path(@user), notice: 'User is created successfully'
        else
            render new_user_path, notice: 'Something is wrong.'
        end
    end

    def signin
        @user = User.find_by(username: params[:username])
        if !user.nil? 
            session[:current_user] = @user
            redirect_to root_path
        else
            redirect_to login_path, notice: 'No user is found'
        end
    end

    def edit

    end

    def update 
        if @user.update(user_params)
            redirect_to user_path, notice: 'Updated successfully'
        else
            redirect_to edit_user_path(@user), notice: 'Cannot update'
        end
    end

    def logout
        reset_session
        redirect_to root_path
    end

  private
  
  def user_params
    params.require(:user).permit(:name, :username)
  end

  def find_user
    if params[:id].nil?
      flash[:notice] = 'user is invalid'
    else
      @user = User.find(params[:id])
    end
  end

  def signin_params
    params.require(:user).permit(:username)
  end

  def user_loggedin?
    redirect_to login_path if session[:current_user].nil?
  end
end
