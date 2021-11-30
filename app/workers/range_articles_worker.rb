# frozen_string_literal: true
# worker for range articles
class RangeArticlesWorker
  include Sidekiq::Worker
  # not retry if fails
  sidekiq_options retry: false

  def perform(author_id)
    @articles = RangeArticlesService.new(author_id).call
  end
end
