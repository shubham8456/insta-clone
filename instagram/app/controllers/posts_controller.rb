class PostsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_post, only: [:update, :destroy]

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
        @posts = Post.all
    end

    def update
    end

    def destroy
    end

    private

    def post_params
        params.require(:post).permit(:media, :caption)
    end

    def set_post
        @post = Post.find(params[:id])
    end

end