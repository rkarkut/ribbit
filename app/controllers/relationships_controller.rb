class RelationshipsController < ApplicationController

    def create

        @relationshp = Relationship.new
        @relationshp.followed_id = params[:followed_id]
        @relationshp.follower_id = current_user.id

        if @relationshp.save

            redirect_to User.find params[:followed_id]
        else

            flash[:error] = "Couldn't Follow"
            redirect_to root_url
        end
    end

    def destroy

        @relationship = Relationship.find(params[:id])

        @followed = @relationship.followed_id
        @relationship.destroy

        redirect_to user_path @followed
    end
end
