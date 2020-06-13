class CommentsController < ApplicationController

    def index
        @comments = Comment.all
    end
    def new
        @comment = Comment.new
    end

    def create
        @comment = Comment.new(comment_params)
    end

    def edit
    end

    def delete
    end

    private

    def comment_params

            params.require(:comment).permit(:description, :user_id, :sneaker_id)

        end
end
