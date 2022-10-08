class PublicController < ApplicationController
    before_action :authenticate_user!

    def homepage
        @posts = Post.all
    end
    
    def show
        #user profile
    end 
    
end
