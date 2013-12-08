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
    end

    def show
        @user = User.find(params[:id])
        @ribbit = Ribbit.new
    end
end
