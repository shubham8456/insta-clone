class PublicController < ApplicationController
    before_action :authenticate_user!

    def homepage
        @posts = Post.all
        @users = User.all
    end
    
    def show
        #user profile
    end  
end