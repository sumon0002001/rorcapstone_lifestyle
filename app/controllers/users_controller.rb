class UsersController < ApplicationController
  before_action :current_user, only: %i[show edit]
  before_action :authenticate_user, except: %i[new create]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      session[:username] = @user.username

      redirect_to articles_path, notice: 'Your account has been created successfully!!!'

    else
      flash[:errors] = @user.errors.full_messages
      redirect_to action: :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
