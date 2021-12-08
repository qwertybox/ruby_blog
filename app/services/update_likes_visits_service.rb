# frozen_string_literal: true
# refresh likes and visits
class UpdateLikesVisitsService
  def initialize
    @articles = Article.all
  end

  def call
    create_visits_likes_array
  end

  private

  def create_visits_likes_array
    arr = []
    @articles.each do |article|
      arr << { 'article_id' => article.id, 'article_visits' => article.visits,
               'article_likes' => article.likes }
    end
    arr
  end
end
