class ArticlesController < ApplicationController
  # here we will build GRUD
  def index # show all articles, start page
    @articles = Article.all
  end

  def show # show one article
    @article = Article.find(params[:id])
  end

  def new # инициализирует новую статью, но не сохраняет ее
    @article = Article.new
  end

  def edit #edit извлекает статью из базы данных и сохраняет ее в @article
    @article = Article.find(params[:id]) # looks for article by ots id and loads it
    # why? чтобы можно было использовать при построении формы (default location: app/views/articles/edit.html.erb)
  end

  def update # update (пере)извлекает статью из базы данных и пытается обновить ее с помощью отправленных данных формы, фильтрованных в article_params
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create # create инициализирует новую статью со значениями для заголовка и содержимого и пытается сохранить ее
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy # извлекает статью из базы данных, и вызывает destroy на ней.
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :body)
  end
end