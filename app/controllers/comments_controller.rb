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
        @sneaker = Sneaker.find_by(id: params[:comment][:sneaker_id])
        @comment = Comment.new(comment_params)
        @comment.user_id = session[:user_id]
        @comment.sneaker = @sneaker
        @comment.save
        redirect_to sneaker_path(@comment.sneaker)
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
        params.require(:comment).permit(:description, :user_id, :sneaker_id)
    end
end
