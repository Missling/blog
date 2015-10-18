class CommentsController < ApplicationController
  # allow only authenticated users to delete comments
  http_basic_authenticate_with name: "ling", password: "password", only: :destroy

  def new
  end

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    # how does it find the id?
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private
    def comment_params
      params.require(:comment).permit(:comment, :body)
    end

end
