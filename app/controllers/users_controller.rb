class UsersController < ApplicationController

    def index
        @users = User.all.order(:name)
    end

     def new 
        @user = User.new
    end

    
end
