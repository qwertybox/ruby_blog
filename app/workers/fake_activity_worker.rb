# frozen_string_literal: true

# worker for running fake activity service async
class FakeActivityWorker
  include Sidekiq::Worker
  sidekiq_options retry: 5
  sidekiq_options queue: 'normal'

  def perform
    articles = Article.all
    FakeActivityService.new(articles).call
  end
end
