class PostsController < ApplicationController
    # before_action :authenticate_user!

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
         
        @post.user = current_user

        if @post.save
            redirect_to homepage_path
        else
            redirect_to new_post_path
        end

    end
     
    def show
    end

    private

    def post_params
        params.require(:post).permit(:media, :caption)
    end

end