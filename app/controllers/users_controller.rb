class UsersController < ApplicationController

    def new

        @user = User.new
    end

    def create

        @user = User.new(params[:user])

        if@user.save

            session[:userid] = @user.id
            redirect_to @user, notice: "Thank you for signing up to Rabbit!"
        else

            render 'new'
        end

        def show
            @user = User.find(params[:id])
        end
    end
end
