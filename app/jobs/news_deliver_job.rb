class NewsDeliverJob < ApplicationJob
  queue_as :default

  def perform
    NewsMailer.index(1).deliver
  end
end
