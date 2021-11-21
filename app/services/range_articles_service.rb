# frozen_string_literal: true

# sort top articles based on their index
class RangeArticlesService
  def call(author_id)
    author_articles = find_articles author_id
    sort_articles author_articles
  end

  private

  def find_articles(author_id)
    author = Author.find(author_id)
    author.articles
  end

  def sort_articles(articles)
    articles.sort { |b, a| find_index(a) <=> find_index(b) }
  end

  def find_index(article)
    (article.likes**2 + article.visits**2)**0.5
  end

end