class FollowsController < ApplicationController
    before_action authenticate_user!, only: [:create, :destroy]
    before_action :find_user
    before_action :find_following, only: [:destroy]

    def create
        @follow = Follow.new(follow_params)
    end

    def destroy
    end

    private

    def find_user
        @user = Post.find(params[:user_id])
    end
end