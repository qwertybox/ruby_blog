class RangeArticlesService
  def call(author_id)
    author = Author.find(author_id)
    articles = author.articles
    sort_articles articles
  end

  private
  def sort_articles articles
    #articles.each do |article|
    #  index = (article.likes**2 + article.visits**2)**0.5
    #   article.index = index
    #end
    articles.sort {|b,a| (a.likes**2 + a.visits**2)**0.5 <=> (b.likes**2 + b.visits**2)**0.5 }
  end

end