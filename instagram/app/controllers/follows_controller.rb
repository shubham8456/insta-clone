class FollowsController < ApplicationController
    before_action :authenticate_user!, only: [:create, :destroy]
    before_action :find_user
    before_action :already_followed, only: [:destroy]

    def create
        if !already_followed && @user != current_user
            f = Follow.new
            f.followed_user_id = @user.id
            f.follower_id = current_user.id
            f.save
        end
        redirect_to homepage_path
    end

    def destroy
        if already_followed
            Follow.where(follower_id: current_user.id, followed_user_id: @user).first.destroy
        end
        redirect_to homepage_path
    end

    private

    def find_user
        @user = Post.find(params[:user_id])
    end

    def already_followed
        Follow.where(follower_id: current_user.id, followed_user_id: params[:user_id]).exists?
    end
end