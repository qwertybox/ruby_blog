# frozen_string_literal: true

# sort top articles based on their index
class RangeArticlesService
  attr_reader :author_id

  def initialize(author_id)
    @author_id = author_id
  end

  def call
    author_articles = find_articles
    sort_articles author_articles
  end

  private

  def find_articles
    Author.find(author_id).articles
  end

  def sort_articles(articles)
    articles.sort { |a, b| find_index(b) <=> find_index(a) }
  end

  def find_index(article)
    (article.likes**2 + article.visits**2)**0.5
  end
end
