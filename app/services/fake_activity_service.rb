# frozen_string_literal: true

# service for generation of fake likes and visits of articles
class FakeActivityService
  attr_reader :articles

  def initialize(articles)
    @articles = articles
  end

  def call
    generate_activity
    sleep(5)
  end

  private

  def gen_rand(num = 100)
    rand(num)
  end

  def generate_activity
    articles.each do |article|
      generate_like article, gen_rand
      generate_visit article, gen_rand
    end
  end

  def generate_like(article, rnum)
    article.likes = rnum
    article.save
  end

  def generate_visit(article, rnum)
    article.visits = rnum
    article.save
  end
end
