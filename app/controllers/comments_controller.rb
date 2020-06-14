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

    def edit
      if params[:sneaker_id]
        @sneaker = Sneaker.find_by(id: params[:sneaker_id])
        @comment = @sneaker.comments.find_by(id: params[:id])
      else
        @comment = Comment.find_by(id: params[:id])
      end

    def update

    @ingredient = Ingredient.find_by(id: params[:id])
    @ingredient.update(ingredient_params)
    if @ingredient.valid?
      redirect_to ingredient_path(@ingredient)
    else
      render :edit
    end
  end
  end

    def delete
    end

    private

    def comment_params
        params.require(:comment).permit(:description, :user_id, :sneaker_id)
    end
end
