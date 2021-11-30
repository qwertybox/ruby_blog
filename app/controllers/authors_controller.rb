class AuthorsController < ApplicationController
  before_action :authenticate_user!
  def index # show all articles, start page
    @authors = Author.all
  end

  def show # show one author
    @author = Author.find(params[:id])
    # @articles = @author.articles
    #RangeArticlesWorker.perform_async(params[:id])
    #sleep(2)
    @articles = RangeArticlesService.new(params[:id]).call
  end

  def new # инициализирует новую статью, но не сохраняет ее
    @author = Author.new
  end

  def edit #edit извлекает статью из базы данных и сохраняет ее в @article
    @author = Author.find(params[:id]) # looks for article by ots id and loads it
    # why? чтобы можно было использовать при построении формы (default location: app/views/articles/edit.html.erb)
  end

  def update # update (пере)извлекает статью из базы данных и пытается обновить ее с помощью отправленных данных формы, фильтрованных в article_params
    @author = Author.find(params[:id])

    if @author.update(author_params) # если пройдет валидацию и сможет обновить артикл, то перенаправит на страницу этого артикла
      redirect_to @author
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create # create инициализирует новую статью со значениями для заголовка и содержимого и пытается сохранить ее
    @author = Author.new(author_params)

    if @author.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy # извлекает статью из базы данных, и вызывает destroy на ней.
    @author = Author.find(params[:id])
    @author.destroy

    redirect_to root_path
  end

  private

  def author_params
    params.require(:author).permit(:name, :bio)
  end
end
