class CommentsController < ApplicationController

  http_basic_authenticate_with(
    name: ENV.fetch('ADMIN_NAME'),
    password: ENV.fetch('ADMIN_PASSWORD'),
    only: :destroy
  )

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :status)
    end
end

