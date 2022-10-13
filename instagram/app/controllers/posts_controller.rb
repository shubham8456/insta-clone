class PostsController < ApplicationController
    before_action :authenticate_user!, only: [:update, :destroy, :show, :new, :create]
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
        @user = User.find_by_user_name(params[:user_name])
        @posts = Post.all.order(created_at: :desc)
        @comment = Comment.new
        @post_count = @user.posts.count
    end

    def update
    end

    def destroy
        if @post.user == current_user
            @post.destroy
        end
    end

    private

    def post_params
        params.require(:post).permit(:media, :caption, :location)
    end

    def set_post
        @post = Post.find(params[:id])
    end

end