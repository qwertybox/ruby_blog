class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end

#  д лайки дизлайки просмотры (без функционала)
# контррлллер аналитика _ топ публикаций, method fake - adds likes, views with button
# посчитать комментарии сервис - квадратичная разница между лайками и просмотрами чем больше разница тот длучше - для создания топ
