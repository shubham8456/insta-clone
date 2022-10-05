class PostsController < ApplicationController
    before_action :post_params, only: [:create]

    def new
        @post = Post.new
    end

    def create
        puts "\n\n\n ----------------- \n#{post_params["media"]}\n ---------------\n\n\\n"
        @post = Post.new(post_params)

        if @post.save
            redirect_to homepage_path, flash: { success: "Post was created successfully!" }
        else
            redirect_to new_post_path, flash: { danger: "Post could not be saved." }
        end

    end
     
    def show
    end

    private

    def post_params
        params.require(:user).permit(:media)
    end

end