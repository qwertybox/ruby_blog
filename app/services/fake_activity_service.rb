#uuid
class FakeActivityService
  def call(params = {})
    generate_activity gen_rand
  end

  private
  def gen_rand
    rand(20)
  end
  def generate_activity rnum
    articles = Article.all
    articles.each do |article|
      i = 0
      while i < rnum
        article.add_like
        i += 1
      end
      rnum = gen_rand
      while i < rnum
        article.add_visit
        i += 1
      end
    end
  end
end