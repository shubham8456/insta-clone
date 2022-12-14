class CommentsController < ApplicationController
    before_action :authenticate_user!

    def create
        @comment = Comment.new(comment_params)
        @comment.user_id = current_user.id if user_signed_in?

        @comment.save
        redirect_to homepage_path
    end

    def destroy
        @comment = Comment.find_by_id(params[:id])
        @comment.destroy if @comment.user == current_user
        redirect_to homepage_path
    end

    private

    def comment_params
        params.require(:comment).permit(:post_id, :comment_text, :parent_id)
    end
end
