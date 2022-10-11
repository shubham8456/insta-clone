class PublicController < ApplicationController
    before_action :authenticate_user!

    def homepage
        @posts = Post.all.order(created_at: :desc)
        @users = User.all
        @comment = Comment.new
    end
    
    def show
        #user profile
    end  
end