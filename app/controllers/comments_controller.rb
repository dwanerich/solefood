class CommentsController < ApplicationController

    def index
        @comments = Comment.all
        @sneakers = Sneaker.all
    end
    def new
        @user = User.find_by(id: params[:id])
        @comment = Comment.new
        @comment.build_sneaker
    end

    def create
      binding.pry
        @sneaker = Sneaker.find_by(id: params[:id])
        @comment = Comment.new(comment_params)
        @comment.user_id = session[:user_id]
        redirect_to sneaker_comments_path
    end

    

    def edit
      if params[:sneaker_id]
        @sneaker = Sneaker.find_by(id: params[:sneaker_id])
        @comment = @sneaker.comments.find_by(id: params[:id])
      else
        @comment = Comment.find_by(id: params[:id])
      end
    end

      def update
          @comment = Comment.find_by(id: params[:id])
              
          if @comment.valid?
            @comment.update(comment_params)
          else
              render :edit
          end
      end

    def delete
      @comment = Comment.find_by(id: params[:id])
            comment.delete
        redirect_to sneakers_path
    end

    private

    def comment_params
        params.require(:comment).permit(:description, :sneaker_id)
    end
end
