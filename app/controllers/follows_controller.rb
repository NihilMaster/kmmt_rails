class FollowsController < ActionController::Base
    before_action :authenticate_user!
    before_action :find_user, only: [:create]

    def create
        current_user.follow(@user)
        redirect_back fallback_location: root_path
    end

    def destroy
        follower = current_user
        followed = User.find(params[:followed_user_id])
        current_user.unfollow(follower,followed)
        redirect_back fallback_location: root_path
    end

    private
    
    def find_user
        @user = User.find(params[:user_id])
    end

end
