class FollowsController < ActionController::Base

    before_action :authenticate_user!

    def create
        before_action :find_user
        current_user.follow(@user)
        redirect_back fallback_location: root_path
    end

    def destroy
        follower = User.find(params[:follower_user_id])
        followed = User.find(params[:followed_user_id])
        current_user.unfollow(follower,followed)
        redirect_back fallback_location: root_path
    end

    private
    
    def find_user
        @user = User.find(params[:user_id])
    end

end
